Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPT1JuI1qWlk3AAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 08:50:58 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACD520CEFF
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 08:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B6A10E21B;
	Thu,  5 Mar 2026 07:50:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914F110E21B
 for <freedreno@lists.freedesktop.org>; Thu,  5 Mar 2026 07:50:55 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-8cb3fb47559so901840785a.1
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 23:50:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772697054; x=1773301854;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KLWXJFRzKXYfvRWexgs1gCb/dTgnevi1M5AetCjur0g=;
 b=oJ39/rhlOng65gmuCKlhNHaPe6uq5jo0AuUXNSE2FeUqV2uU6uWv4Uv/hcbdTybmnA
 Rp+MHcp/uZN5m4uUwlFk4NNbmF+fxA/5jXxCo2+i4obOE+dSQgBNXQr3yGuA6S7K+Rxj
 NfDY83P20LwZ7ycgXr6yoEt4i8fWEkN4YHCJhqLb/aiwxvUX36Mn1mMsV0m4wGFddgRg
 dPZZ6u3QCRY59cFIt8wl2kz9UqXSjhv5/8Xgz9M40vkHJMTCA7Po9vx3791n4j2iNnF4
 5JNc+r3712+7HE0omPpy4pgIGV4gMEQ4g1l5eoJNMv8mSXHCLcVxAbVFNxQF8EAOltmJ
 0ixg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkBq7uLnZZCvL/7x7KlYqgd4Vv2j8Ur/eevlFHjhTQo5iyHoslyS/Pi1oX45G5d0ZIoY91yuRloXo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+juxqjLdyF9TMQu5EKf1WFnK0WNz6chO9eEOiP/5n2cRUbxQo
 aT3OaeLu8NYVPXxz9+tIJwzKmiVc2e8IPN/ykgdBRslhh2NCpM5AV9xfk3AsZmDT
X-Gm-Gg: ATEYQzwjT7z+thcFiGVYZytSUoSah5nkAfe7CdrJtRTpfIqDfMS68PNfAhUiUvFpSbZ
 uDiwznb868NaeOOB963FrBfFlWU/gc2Lgqb8C+iDsoDWu43cpAgp1W94yRcnzmAQ08PuStFGj2e
 XMm109RBIn218XerLRNkvD9TORjX1MjzU2nkNGJJrI4Am3lYFWJ7PJPuZ4WPsS5krtOxIa9AMcD
 PFKWhSj6z/5jae7sRqbuCh7W1iGG+m4hYtojRnKTZCA4g74HktDmdq/OKhuvsi/LuJ4W0TCYKC+
 D8M66vReh+YZ4+RAKhYl54oIBixAtUrx7tFeiYCAj/ptKPXqcFnlKnv9279fSPd6BZjnJVe/jdi
 7V8m6mm23RqtDYOh9R6iqc+0iEiHrp95c0KfcViEmaQjWoX75KcnsxpvRAsgEO3mBYFSrksc442
 BGRNEx1TZvSvUWXtNrYVibBhNktig4b9WEWeJ4I6Kl/FS2YSi1E0eCKyzXMhA17pOPoWUJjls=
X-Received: by 2002:ac8:5a82:0:b0:506:2041:13ae with SMTP id
 d75a77b69052e-508db363745mr56679911cf.43.1772697054500; 
 Wed, 04 Mar 2026 23:50:54 -0800 (PST)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com.
 [209.85.219.54]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50744ae9313sm173287681cf.29.2026.03.04.23.50.54
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 23:50:54 -0800 (PST)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-89a0d53f3d1so28776786d6.3
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 23:50:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVG6W8tM6vP4l2o/CR2ABtKU9JbtJqG//B+cw6ldmnZXCDbYtcFt/Amj0AVHYabqIROjPuizvKgQ8U=@lists.freedesktop.org
X-Received: by 2002:a05:6102:441c:b0:5f9:3a22:85a2 with SMTP id
 ada2fe7eead31-5ffaac72675mr2059267137.12.1772696734612; Wed, 04 Mar 2026
 23:45:34 -0800 (PST)
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-6-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-6-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:45:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
X-Gm-Features: AaiRm52ziEM93YxO07h7pOV0rTYZnULijxTOwLRm9EW_k_lOxLulmwK4PITV2jw
Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
Subject: Re: [PATCH phy-next 05/22] phy: add <linux/pm_runtime.h> where missing
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
 UNGLinuxDriver@microchip.com, Peter Griffin <peter.griffin@linaro.org>, 
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
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
X-Rspamd-Queue-Id: 0ACD520CEFF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vladimir.oltean@nxp.com,m:linux-phy@lists.infradead.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-can@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-ide@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-usb@vger.kernel.org,m:netdev@vger.kernel.org,m:spacemit@lists.linux.dev,m:UNGLinuxDriver@microchip.com,m:peter.griffin@linaro.org,m:andre.draszik@linaro.org,m:tudor.ambarus@linaro.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,microchip.com,glider.be,gmail.com,sntech.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[freedreno,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,nxp.com:email,mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,glider.be:email]
X-Rspamd-Action: no action

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> It appears that the phy-mapphone-mdm6600, phy-qcom-snps-femto-v2,
> phy-rcar-gen3-pcie, r8a779f0-ether-serdes and phy-rockchip-typec drivers
> call runtime PM operations without including the proper header.
>
> This was provided by <linux/phy/phy.h> but no function exported by this
> header directly needs it. So we need to drop it from there, and fix up
> drivers that used to depend on that.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

>  drivers/phy/renesas/phy-rcar-gen3-pcie.c       | 1 +
>  drivers/phy/renesas/r8a779f0-ether-serdes.c    | 1 +

For the Renesas parts:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
