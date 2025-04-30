Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA83EAA50D1
	for <lists+freedreno@lfdr.de>; Wed, 30 Apr 2025 17:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A42710E7DF;
	Wed, 30 Apr 2025 15:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Coi9T4cj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CED10E7EC
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 15:52:10 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-739525d4e12so56303b3a.3
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 08:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1746028328; x=1746633128;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9LtmMorPZzn1CDLSUkR5sDQj/vapTL2vnbBygv/Tdmw=;
 b=Coi9T4cjXFH2VtSOQKKG9BkTLjVsvILUtbzpQB4uBrWRtah8JRQ1hDh/obst2qpwm6
 X/iujuKQeDW/vSBboCBHqOiCF/f/xkTN5DtSL1dinWswbNUz3vUsLrZAeZRhb6Dn2c1T
 OOtNVnKXWXdr+yuMEk0cZLC/GZr5z8P/ZNc5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746028328; x=1746633128;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9LtmMorPZzn1CDLSUkR5sDQj/vapTL2vnbBygv/Tdmw=;
 b=jFoyqRWlkhwev905Bmszi25x9ckMpOH9SNdMKgqTEih2P28if8ziaEPQPyPxQ+CI10
 TjMDdr/KgHq7uMH/rb/bPpm05KD5VRHpCriyhiXFqfKFU5qLjF4KqhxrBmHYJaInC/rs
 Eg6PvLG3IuIj9hFw3as5KSOEOoxkB6SP0TliVYRW3n+FhLrYUOktwF9imUVaZAajJaFe
 rVLGMT9BptojTZGtAdULfLhTaDCX2dS2y9lQTwhEvzE0+4EWRvNY4yU1KKbJSQFy2Qmt
 7WuBrpfO6kwh6qyhVsIuz0RuXJFCQjfrDJGq4lB0YaIes6kg9gws7i2nsatccuLpAiNh
 /JFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVouLadH5s9Zr6UuXhXb4uOUiL01SNiXjWA2f9tVvLzvcRJ7s9xImTeNo0VHDVg+sEN+mb0sxIpKH0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwApLhy6CZgjkKGpijAEVOPrLOeMQznVAgSsxYtzMtv6JggOMeL
 dvIECKDcFrVk0DnLhKZFzyeNOqF5imUrO+xNZb5thsVGvuOuELVg698kofCKsdCeFHqI1zF6NIw
 =
X-Gm-Gg: ASbGncsIxMV5HZ9GBaEZbbSDXwk7/7SA4Uayoudm+eotl8myRYuSIDqzXBsD+SVux0/
 Dlgmxrsvk5HttUfxuCIPRDMY0jTZ9BthCmXg8SnpWKJSHQbk/lBjyebjG0lhq7ThCsuIu0GzhAc
 CN++INopzuME3kChsmKJqhyaQcqZ5Z4WYazG2OYC95iZIBPdtnKpS+4iuzaEYzdElqg+S1Jb1K2
 g7gIPyWsuFT+Hgejyv3U3ZZ403SH6G/S8xdUUuunnDnwLzluyIbgByS+bxORdlvbw7H/6yoQC/6
 WUsAMVHst81l8F+39rj8rfMZhWpPqtgNfXDYrtwOFTmYOfOTECe5/8Ff11XpRPQKUWGWSh1dWQb
 r7CHS
X-Google-Smtp-Source: AGHT+IFhbJhwOZJzjyuAsXa7cGSwkQ3VZqYf0iLVa/72di6wsVdNQCdoGaZatHodPzu0EeEFk19njQ==
X-Received: by 2002:a05:6300:4044:b0:203:c29b:eb6c with SMTP id
 adf61e73a8af0-20a87647a4amr4805576637.4.1746028327975; 
 Wed, 30 Apr 2025 08:52:07 -0700 (PDT)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com.
 [209.85.216.54]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-740398fa1fbsm1818316b3a.34.2025.04.30.08.52.04
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 08:52:07 -0700 (PDT)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-3054ef26da3so52312a91.3
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 08:52:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWHK6KEeLfsJgWC5gJtvdqOylNJZy8iA2/shpeglCyY7aKJTghO6Ac5d2CQKTGT93e4NTgG3juJ4kY=@lists.freedesktop.org
X-Received: by 2002:a17:90b:17d0:b0:2ee:d371:3227 with SMTP id
 98e67ed59e1d1-30a3330bd2amr6121407a91.17.1746028323966; Wed, 30 Apr 2025
 08:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
 <CAD=FV=VmV5yb0HWWGTiKyyC8+WNPJpM7vE9PQGh5_=KPk6+HCg@mail.gmail.com>
 <20250430123557.3d8b1de4@booty>
In-Reply-To: <20250430123557.3d8b1de4@booty>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Apr 2025 08:51:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
X-Gm-Features: ATxdqUFfYEEYqvpO67K1TXBYapYURxE3d7Z_gt9FzIWHk5tUMzE1QBIfnvJL-xI
Message-ID: <CAD=FV=UBFhCGOUuwtCtdT75nCu_7EzM-SVY-=6Xh6UxUuxKCMw@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-stm32@st-md-mailman.stormreply.com, Adam Ford <aford173@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>,
 Aleksandr Mishin <amishin@t-argos.ru>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Christoph Fritz <chf.fritz@googlemail.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Guenter Roeck <groeck@chromium.org>, 
 Heiko Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>,
 Janne Grunau <j@jannau.net>, 
 Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, 
 Manikandan Muralidharan <manikandan.m@microchip.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Phong LE <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Vitalii Mordan <mordan@ispras.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Wed, Apr 30, 2025 at 3:36=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello Doug,
>
> On Mon, 28 Apr 2025 13:59:50 -0700
> Doug Anderson <dianders@chromium.org> wrote:
>
> [...]
>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
> > Tested-by: Douglas Anderson <dianders@chromium.org> # parade-ps8640
>
> Thank you for your review!
>
> However I'll be sending v3 with some differences w.r.t. v2, in order to
> fix the 3 bugs reported by Andy Yan plus a similar one I spotted. The
> fix just is replacing PTR_ERR() with ERR_CAST() in the 4 cases where the
> involved function is returning a pointer instead of an int.
>
> Your review/test tags appear global to the whole patch, thus being the
> patch different I think I cannot include your tags in v3.
>
> Let me know if you think I should do differently.
>
> Sorry about that.

It's fine if you want to drop my tag. I didn't have time to review the
whole thing but I felt like I should at least review the drivers I'm
signed up as a reviewer for. That being said, I'm not counting tags or
anything so I'm not offended if they're dropped.

My understanding is that the hashtag at the end is at least a
semi-standard way to say that my tag only applies to a small part of
the patch, so it seems like it would be OK to carry it, though...

-Doug
