Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C382B56853
	for <lists+freedreno@lfdr.de>; Sun, 14 Sep 2025 14:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F055210E22F;
	Sun, 14 Sep 2025 12:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="imz9D0ZW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6062510E237
 for <freedreno@lists.freedesktop.org>; Sun, 14 Sep 2025 12:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757851722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TGC4WoAJlpX9tdCXckzAZr5W3saj1ZSsINit3PsYuzA=;
 b=imz9D0ZWulrhNzDA9ecq5NsgrmHxFAE22jVC/qw8KJNN3prtT1ImYL6dKQcMGnMcfjN3kg
 7pNJnJJPgdc0tTAKSAcvFfU3XnvL9LT/4du4A/9qLEu6VFkP3vCO4nCQ6T4QEks20jA3g8
 81W68oipXGK5MKoYBJ5XpezqP5DZzuQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-IFD0GzHzMK68TXI68PN33w-1; Sun, 14 Sep 2025 08:08:39 -0400
X-MC-Unique: IFD0GzHzMK68TXI68PN33w-1
X-Mimecast-MFC-AGG-ID: IFD0GzHzMK68TXI68PN33w_1757851718
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-828bd08624aso119249985a.1
 for <freedreno@lists.freedesktop.org>; Sun, 14 Sep 2025 05:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757851718; x=1758456518;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TGC4WoAJlpX9tdCXckzAZr5W3saj1ZSsINit3PsYuzA=;
 b=bHHZwhF8wzus58vDLP9DYCCPZ+6+S/3RmZ2aNnnnq8LJnqKbpgoJRz0WT/a2cRkDw3
 BoMauY2BH/1Sz0L0Sm+U6Xl6vui/NF0z7+ZAuOZG5quKh5JDSINfYMcJ8cTeYKmb3Gml
 L2jSOaG3wdi+bxbLN3UTaymfElQRT/3Wlw50Zrnu9zYdjW42Qf0VoiyAUy/zhCwgg0rp
 hHnxTBCNRW5CyP72Mv8tds6OMRdnvur4Bctp3PoM/sDA28lEaFNKfVpaElMYZHqau644
 Ko6773SSZiNJy4qNhQUPmPhQOOme358QOUcPinRkPNla70cbxU7KsZ0uYQ8MOzFTcYfn
 f57Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPPR8kut7Ibj52/rRsKVL1IyBnCUgNI7kLDabPXKqB2QscnAp6MbTBEpa8nMaeuE8lGPwUMQD0X4M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvkMjGWyNjcfbcR0bQ7KdkNom9S125xClxIEi+C91v256tCgg/
 9BlkU2fAY1/Pcfd5vLXeIrG3b+oXMGxxd6EmICbrh4fC+0mzIjwLa1sJSWj8L0tCyhBI/fPpa49
 3KbsotK1toYH9yTolx1hrXA2DYsgMF9VhBoKyen+Oiyrns2imqVT2Z0fi50yLNWKkeGlrxw==
X-Gm-Gg: ASbGnctfJJ3qKYHv0kGA+pbnqa6G82n/bwfPdAhCAWpaPPaL80Y1KhGFDDIK9mYQzCH
 JRB+QVxwJd59RB8kSgc43DXFGRc+T4rOJ0fLaB+Lr3mlj4GNJk7jzvj8zifHMGeQuP4UnBpUs2X
 MpifmOjaD4+eWf+se5OERRYhG9uZE0H54xaiaNhEHhBp6n++knEXZWlU3h9ekvnHpEOwdY/mEeC
 r0pj7iISrpYowaMZ72HRIbAAwbrGXMl0Ubr4ssJAfOyg9uaIatFGD+UcSn7vaXpazMqTQ2Mk6Qv
 bH9QWtHNY6N07SInxT5bA3dL6um9iwvISGbDu2i29L45KQCCE8z2vfOJyRmceF40HSlv6LhB9B2
 UA/nud7IJeVA13Z5NTTc7S5xf9cuor+s=
X-Received: by 2002:a05:620a:c4f:b0:815:9bd3:72a4 with SMTP id
 af79cd13be357-82401a95c9bmr1036170285a.69.1757851718254; 
 Sun, 14 Sep 2025 05:08:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRdCKGXPgtbhvJpUCdDwCaaC2B0DLna/CzbBAvfkLzYJU98qL9IvUSFcqawGBto49lPMPxgQ==
X-Received: by 2002:a05:620a:c4f:b0:815:9bd3:72a4 with SMTP id
 af79cd13be357-82401a95c9bmr1036164085a.69.1757851717778; 
 Sun, 14 Sep 2025 05:08:37 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-820cfcaca15sm580413985a.71.2025.09.14.05.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Sep 2025 05:08:37 -0700 (PDT)
Date: Sun, 14 Sep 2025 08:08:33 -0400
From: Brian Masney <bmasney@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/9] drm: convert from clk round_rate() to
 determine_rate()
Message-ID: <aMawQYUIjPw9m4IO@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iLaZimls8YafSyoBimwPyz54PNDWCth8UweIfx6ycAs_1757851718
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi all,

On Mon, Aug 11, 2025 at 06:56:04AM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the drm subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.
> 
> Changes since v1:
> - Drop space after the cast (Maxime)
> - Added various Acked-by and Reviewed-by tags

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

I'm not sure which tree(s) this should go through. All of the patches
except patch 1 have at least one Acked-by or Reviewed-by.

Thanks,

Brian

