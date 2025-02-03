Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8EFA25CB9
	for <lists+freedreno@lfdr.de>; Mon,  3 Feb 2025 15:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94F510E521;
	Mon,  3 Feb 2025 14:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hwgWHfII";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA4210E503
 for <freedreno@lists.freedesktop.org>; Mon,  3 Feb 2025 14:35:49 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5401c68b89eso4097880e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 03 Feb 2025 06:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738593347; x=1739198147; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=q/CBL2MqSqojMhTBmJBlsXjTebcqv/OWdhdx1LIiXsQ=;
 b=hwgWHfII9ibfdjrG4t6FzN0kUegqSdXO9fP1p3RwXRI3XitAOWMdNyfaERQPIOxfoM
 mNbWe4rWCOi/mooSuG2e2T6y3DLz59TBXDxGe2YK6W17zJV3wYq0zY/4EeDBY5IiJCbq
 F6slC7oOG1U3y9T+CxIqGgUMimomv9jLGxpPxvH8DmszEeVqsd59s3FB9HK89H7vrgSi
 er5b45BYSEgtVe4Eq+cQy64NllwA5PWuZqzOHn0WSiqnpWwRQ1R6KNl9HewflXIguTEh
 hbu+t3Fsjf2UkuUA7GbXDbZDlakfqFq2ptwUUGxnAEHVqvSuUOT+tqTyT4oZhVLV4ZtD
 8gxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738593347; x=1739198147;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q/CBL2MqSqojMhTBmJBlsXjTebcqv/OWdhdx1LIiXsQ=;
 b=JK1fQX65hrYrojjsnhq9oucjJJlcQEUe60NyM87cYU9CS9oCJGEOGvmk/XKeksG/iU
 p0k4pQGtX3UdGyMnwRLKgi2iFNSHgRXY3ml15eqRhBO9gfdf3leTDolh6mmMDhIg8smZ
 Ub6plhUuo5PIE27WaxmMeeaG81wnYwkhAs8iFXZteWkzsCv4Rc6/6UFmWllS7q56SoeQ
 fHTfNTtDN3vnBI5Nk6Domd2/WbftiinP09aOVA/nlDfXNYlWkxZebszOvxA0eIwAVix4
 Z8TPkL4ZxJghfNqFAyjodC15CSM7e4IxFbQr7PcR4QgQazj/XIr5wlMIn3TCSded0H42
 5uVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKKed38CbDOCiwduKlt4N+xvJNbj8e7UE6mA3rs4OIEEauDl1OsCHXBFkTR5QU5NbHOB+2+9ZUkiU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBqMy94nZIpz8nebpkKrTwFPLZPW7WOFCg+6EvvB1EM94DT7nr
 NlfC/Mpq1FO6vQ/TiNPYecPtVWgj0TRTwIOHVvD/yhojuptdo1xMhjNpzjVsTHc=
X-Gm-Gg: ASbGnctHibd67e45gnGNwncw6Ey1HZ/I3uMcCfU7rGvO4Kgj1v+DwF/VgnClgc/WXHf
 OGfTFYo8BZeX5Fze3D5INxuuEdk1W/Q6CGh9Z538tniIQJCxIi1aQm+GU3K67euZD2SouZCIw7V
 S/GCquwmt7sH3X9fDqd9Ori3ejgjXcz/8EbzsYjjMTKhMlWAjkLQ7LSIKnQRJT3iBURDDu57Wvq
 CDfCVkztrMfy/ESi9VVaIqrsAz2C9w5OiKhthe7YdRXGO6RfxGSb54vcR5DTA9tbKza/vlr7+6S
 JxHUxJPB3/cNgQaGq5koZTQ3VXIfmfdF/991aRZ6jL6aEW+dQ1xUWbiLcBspjthUJ9BAvA0=
X-Google-Smtp-Source: AGHT+IHmpsMOUXj9J7uJNG7xObWsutT5JkdY7XQTqCfqYOO3ezVejDnIR+luTef92RNP0eR3hf/euA==
X-Received: by 2002:a05:6512:32c9:b0:542:7ff6:73c4 with SMTP id
 2adb3069b0e04-543f0edde38mr3901410e87.1.1738593345964; 
 Mon, 03 Feb 2025 06:35:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307a3097f27sm14979041fa.45.2025.02.03.06.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 06:35:44 -0800 (PST)
Date: Mon, 3 Feb 2025 16:35:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
Message-ID: <7srflbpb72amuky33bv2etyuo2wcmrcmrlc6sknx37gzp6v6s2@qpxelvzoo6gd>
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
 <20250131-drm-msm-phy-pll-cfg-reg-v1-2-3b99efeb2e8d@linaro.org>
 <p3ybn4zsbipks2mzve5uybow3s5baydpmevuzfk7twejnk4cp2@3ljzapngbe65>
 <2c10caef-09b3-472b-9d1b-4d35083576e7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c10caef-09b3-472b-9d1b-4d35083576e7@linaro.org>
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

On Mon, Feb 03, 2025 at 12:19:04PM +0100, Krzysztof Kozlowski wrote:
> On 31/01/2025 17:25, Dmitry Baryshkov wrote:
> >>  
> >> -static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >> +static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
> >> +					u32 val)
> >>  {
> >> +	unsigned long flags;
> >>  	u32 data;
> >>  
> >> +	spin_lock_irqsave(&pll->pclk_mux_lock, flags);
> >>  	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> -	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> +	data &= ~mask;
> >> +	data |= val & mask;
> >> +
> >> +	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> +	spin_unlock_irqrestore(&pll->pclk_mux_lock, flags);
> >> +}
> >> +
> >> +static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >> +{
> >> +	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
> > 
> > PLease add these bits to the corresponding XML file (here and later on)
> 
> 
> I need some more input from you - I don't know which XML you talk about.
> Do you think about:
> drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml

Yes

> and others alike? But doesn't it have only register offsets, not field
> offsets?

It can, see for example the mdp5.xml, you can add <bitfield> under the
<reg> node. Be sure to install python3-lxml and enable
CONFIG_DRM_MSM_VALIDATE_XML if you are modifying those files.

-- 
With best wishes
Dmitry
