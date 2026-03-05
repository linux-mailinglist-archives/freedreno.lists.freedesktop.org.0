Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIKgJA0/qWnK3QAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 09:30:05 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8E520D779
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 09:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6077810EB6A;
	Thu,  5 Mar 2026 08:30:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A41610E227
 for <freedreno@lists.freedesktop.org>; Thu,  5 Mar 2026 08:30:02 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id
 a1e0cc1a2514c-948029fb1f2so2298690241.0
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 00:30:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772699401; x=1773304201;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Ymdw+XC/6Jy9fN+NX35+E/o8bLZmtxZBZ4e3pQeTxE=;
 b=q3U6zFuRyf/irEwJaW2fTUAWqbGoPMeApkaI77nppkbyzPHUeFDnrJRlW7r/pToPJR
 kKAx7Br0dIFG180cCPCAhdrzCm88JIh8Rb5VkZoVYHh8jMw49fsYxLJGUkX+hm0yfArT
 5xTSrGCBB/ix1qY+PHSXERgg8YGYJ/VSU4pbnPXXjW/BKO/SUV0PhaLnZn4LPkDsYaNa
 62REiD1pBtfuKNo5Ic2+bYGkRo5EUrIXwuGaEBLgLGcul9mTTzh8/ZO9GESCU88Z7oei
 Rn2X02KZq0lW+MHVCA7a6UDWafBGBJYTyISjbkvzfV0GS4YXO0yO5+JKCJcNguWcPPs3
 EECQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl9J0sxMBacOPkHJSqdmLNFHYNAfNjXYHx17rnT3VAlJmQ+5BR67MV+iIocTZD+toqsB8UsHFIXWA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynVyZKG9evqgvduOduMvhVD1s8d4pGsWiBossAxG71rH4vET0W
 +B8GgcEujQrhZ/iiSLXBJ0/30m4qkuRVeeNfa/qw6wtEtZMBYBVNEleF2w2muj2c
X-Gm-Gg: ATEYQzymh9kBawMTkijp5SFMX2wzizbHkY9yHNdVaJa8oB81Ko/rLxzFaupxwM71rrj
 TyrwDCzoTmDRT0v4eUL2y7eueplbCcmR5p+FETm3ptzr/8j+6fZj04egp1bnzRyIyXsTCsH53VS
 1g6UU0naeW2kgrQvs71oh5pn836MqaSl4IUk/oNE3btklnESuyQGQqaAqC1kJ0VtdqeJSgstICB
 7IQ3DLItH4O9D44a6E3BzwKRM45VU8QAI4eXuXvKX3KLx1mdDxeHxvPBUbnjM7od4Vge57k3AIZ
 6Dkgr9rLDosxmaAUcfzguI8CVrp7azEhpw7oA8mWdi79A0efU+EB9r/kzEzDCz8QTyr5QAsBVQN
 xKyySaxEorDH+ps/Z0Fwk724JlXbZ6qF6z0LFjUlP93ADkK/h0yPXvU5/4AiUpcEvaHpI9z70fK
 OiBd4dQGwKm8LolcMIUq3oBqXAmNcyWKYhKXayWVD9SVdeVxuji6wBZOmcf+Fq
X-Received: by 2002:a05:6102:17c2:b0:5ff:c510:b7d3 with SMTP id
 ada2fe7eead31-5ffc510c9bemr613207137.16.1772699401056; 
 Thu, 05 Mar 2026 00:30:01 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-94df63d6f03sm20448589241.3.2026.03.05.00.29.59
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 00:30:00 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-94abd52b274so2089393241.3
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 00:29:59 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUVrcA8uUvaQ4Uuh7ou3fFXK8Zjj7hkZyQeVay7jkrsZoEiMXvXCNMuOGe0VYCgtvCE7LZzu6Rt80Y=@lists.freedesktop.org
X-Received: by 2002:a05:6102:2ac9:b0:5f7:24dc:3ac3 with SMTP id
 ada2fe7eead31-5ffaaa86250mr1899404137.7.1772699399463; Thu, 05 Mar 2026
 00:29:59 -0800 (PST)
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-18-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-18-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 09:29:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXUBhpnFEnnTfyPdECWqNmKLweupX=FY2SedYA3bapG2g@mail.gmail.com>
X-Gm-Features: AaiRm53mHozL13yvxji6rv0MKzaGvWxuhr7SWHD2SjBJ0VWNhqppZZeXezGpDhg
Message-ID: <CAMuHMdXUBhpnFEnnTfyPdECWqNmKLweupX=FY2SedYA3bapG2g@mail.gmail.com>
Subject: Re: [PATCH phy-next 17/22] net: renesas: rswitch: include PHY
 provider header
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
 netdev@vger.kernel.org, spacemit@lists.linux.dev, 
 UNGLinuxDriver@microchip.com, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Michael Dege <michael.dege@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 0D8E520D779
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vladimir.oltean@nxp.com,m:linux-phy@lists.infradead.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-can@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-ide@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-usb@vger.kernel.org,m:netdev@vger.kernel.org,m:spacemit@lists.linux.dev,m:UNGLinuxDriver@microchip.com,m:yoshihiro.shimoda.uh@renesas.com,m:michael.dege@renesas.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[freedreno,netdev,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,nxp.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,glider.be:email]
X-Rspamd-Action: no action

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> As a PHY consumer driver, the Renesas rswitch dereferences internal
> fields of struct phy, something which shouldn't be done, as that is
> going to be made an opaque pointer.
>
> It is quite clearly visible that the driver is tightly coupled with the
> drivers/phy/renesas/r8a779f0-ether-serdes.c, which puts heavy pressure
> on the Generic PHY subsystem.
>
> This was discussed before here:
> https://lore.kernel.org/linux-phy/20260211194541.cdmibrpfn6ej6e74@skbuf/
>
> but to summarize, it is generally expected that when a Generic PHY
> function is called, it takes effect immediately. When this doesn't
> happen, the PHY provider driver must change its implementation rather
> than the consumer be made to work around it. PHY providers which rely on
> a hardcoded call sequence in the consumer are just lazy and wrong.
>
> The most obvious example is commit 5cb630925b49 ("net: renesas: rswitch:
> Add phy_power_{on,off}() calling"). Problem description:
> - Ethernet PHYs may change phydev->interface. When this happens, the
>   SerDes must learn of the new phydev->interface using phy_set_mode_ext().
> - drivers/phy/renesas/r8a779f0-ether-serdes.c implements phy_set_mode_ext(),
>   but this only caches the mode and submode into channel->phy_interface
>   and applies this to hardware during phy_power_on().
>
> The commit author decided to work around this at the consumer site, by
> power cycling the PHY for the configuration to take effect.
>
> This had a worse implication from an API perspective in subsequent
> commit 053f13f67be6 ("rswitch: Fix imbalance phy_power_off() calling").
> It was observed that phy_power_on() and phy_power_off() calls need to be
> balanced, and so, the consumer decided to start looking at the struct
> phy :: power_count (the technical reason why I'm making this change).
>
> This is also wrong from an API perspective because
> - a consumer should only care about its own vote on the PHY power state.
>   If this is a multi-port submode like QSGMII, a single phy_power_off()
>   call will not actually turn the PHY off (nor should it).
> - the power_count is written under the &phy->mutex, but read unlocked
>   here.
>
> The rswitch and r8a779f0-ether-serdes drivers both need to be completely
> rethought in terms of Generic PHY API call sequence. There is no quick
> fix to apply. Just include the PHY provider API along with the consumer
> one, to keep working as before when struct phy will be made an opaque
> pointer to normal PHY consumers. But this is a bad offender (and it's
> not even a provider) so add a FIXME.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
