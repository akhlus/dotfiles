import matplotlib.pyplot as plt
import toml

def read_colours(toml_file="theme.toml"):
    colours = []
    with open(toml_file, 'r') as f:
        data = toml.load(f)
    for i in range(16):
        key = "base0" + str(hex(i))[-1].upper()
        colours.append(data.get(key, []))
    return colours

def render_colours(colours: list, output_file: str="theme.png"):
    fig, ax = plt.subplots(figsize=(8,8))
    for i,colour in enumerate(colours):
        row, col = divmod(i, 4)
        ax.add_patch(plt.Rectangle((col, -row), 1, -1, color=colour))
        ax.text(col + 0.5, -row - 0.5, colour, ha='center', va='center',
            fontsize=18, color='white', bbox=dict(facecolor='black', edgecolor='none', boxstyle='square,pad=0.'))
    ax.set_xlim(0, 4)
    ax.set_ylim(-4, 0)
    ax.set_xticks([])
    ax.set_yticks([])
    ax.set_frame_on(False)
    plt.savefig(output_file, bbox_inches='tight', pad_inches=0)
    ax.clear()
    fig.clear()

if __name__=="__main__":
    base_path = "/home/sam/dotfiles/hm/cosmetic/"
    colours = read_colours(base_path+"theme.toml")
    render_colours(colours, base_path+"theme.png")
