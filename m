Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 718C49E077A
	for <lists+freedreno@lfdr.de>; Mon,  2 Dec 2024 16:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4880410E79F;
	Mon,  2 Dec 2024 15:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K0ZqI242";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CC210E7B6
 for <freedreno@lists.freedesktop.org>; Mon,  2 Dec 2024 15:48:18 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53de579f775so6088439e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 02 Dec 2024 07:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733154496; x=1733759296; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xfHRG0ckbabpB5WkAOGLFC/tsNXMkX3A9rmcYDbuN4Y=;
 b=K0ZqI242aiYpVJK5uuPa93cfyDxeH2LfmEAXQ3VIqKyy11Vue7D+4T/M8qnuNiGz7k
 jzi2OKPbQW9UaCPoj3V8PUNGu+BdcnExkHlIL6Dd0fv36iZdB3zkzeKCdqzLkOUINDPS
 Oi4K3KmE048vMhN3xuqYYEdGBuQafR4CvJERY7mi8cbyvsdL6U1K2q611Fix3Vx6Q1dh
 UMZJwMyDQWfAPOPfExpY1Pz9DQvpbr1Z1D+kEMvuztfcgPGAwWwSZSrSn/YFR0LeZzk8
 KXqNgECX6d5P7xqeWuA015sDfrCMMjpFU3q4lCcLTPuSlCPvBq4iSRWGHDwFE7/ZirN9
 tH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733154496; x=1733759296;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xfHRG0ckbabpB5WkAOGLFC/tsNXMkX3A9rmcYDbuN4Y=;
 b=jqoqszwTHOSAr7eap6UE00ny2euPC9sclLdKpAXBNJRHoAVxvW9ZcotmS49nVEaoQS
 bWOIlnvsw8UXuJPwta8Nf29MBgFEVcRGKOQr4q+WTEev7xFYbVffDatKWi3pmaqovM/2
 E23hoItx8sPFPrqZkI+tOhdJbG01Vfd+Zzs7Qgi0b8Z1cY5dY1RuncEQhoAYb60R3AZY
 N3sK1SqaZHP8rWBBeUX3lOb5vMipYVqNHq1N2XpL2oZ+nE+0OWtTgJ8TwS9xOekj3BCn
 QbX6/VIPHMgcVUE1CSPgJvPe5ylJoSqaPfkZ222i7C/Vq0P18oJX/ZmG3lXnHj1o8LV7
 78dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbnF4hUzHSbXSckWgt0V1VPZSGB9Dg3wNpWY2zvan98D9pnTds9+0AUFKqoTMy6cE44XIBmDbT2bk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRBYO5eZfQoUEOR7gdv7znLsiHom2b3Q3N/6I4HPhI9RfHGqHs
 0BHGHwaUYe09kfvbosA2zaLtrjJ+v0EYMpkPwe9fN4KJqU1yy8cSfrDJoHRXYqQ=
X-Gm-Gg: ASbGncunTvqfBb4PMFHzBY0BYaCubb8gjqOhZ2h61Q95i1ZgEVHa3Sa94LhIt4oLDfZ
 9yGEB8bAYU3vxkPBPz7anKEIO5y273pD6HJ4l6YYpCXkWvrC20Ylw8iM4J6XzG0JjllKXfCmA2f
 3QohhA/vDkoEMehl8EAhyTN2LckSvTPsOywyubq2l/IZRzk3m3eJZS2MN6IHTCJLZN+mguSVrB3
 yC3cvTjW1qGAi4tZkzdvi+iwr2kUhxFoevJc5DB+9np35P8CfUkduphi+kDfwRg7yNp6MV/VTlT
 9LUl6+M0NrBvZqQq98P+5+Gz3JxhhA==
X-Google-Smtp-Source: AGHT+IG0Q5k/W3ed0OQwMlkM6qlSogEM4cPmSjYiJhbwpudSDr/7EC5mlTOxyGWNLuXKmiBWsxS+wQ==
X-Received: by 2002:a05:6512:3b0d:b0:53d:ed95:9bfa with SMTP id
 2adb3069b0e04-53df00a96d2mr17148818e87.7.1733154496365; 
 Mon, 02 Dec 2024 07:48:16 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df649f638sm1511742e87.239.2024.12.02.07.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 07:48:15 -0800 (PST)
Date: Mon, 2 Dec 2024 17:48:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/8] phy: qcom: qmp-usbc: Add DP phy mode support on QCS615
Message-ID: <gnrdym5o345fsbtxmfis6ykep7mzvhkxxnizlj5xplrsaaijjq@5465y2oamqoh>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef@quicinc.com>
 <b310587f-c6c3-41dd-83bf-6affbcc65730@kernel.org>
 <22600892-3b0d-4b0f-9c46-e74241960dda@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22600892-3b0d-4b0f-9c46-e74241960dda@quicinc.com>
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

On Mon, Dec 02, 2024 at 06:31:44PM +0800, Xiangxu Yin wrote:
> 
> 
> On 11/29/2024 4:18 PM, Krzysztof Kozlowski wrote:
> > On 29/11/2024 08:57, Xiangxu Yin wrote:
> >> +static int qmp_usbc_com_init(struct phy *phy)
> >>  {
> >>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
> >> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
> >> -	void __iomem *pcs = qmp->pcs;
> >> +	int num_vregs;
> >>  	u32 val = 0;
> >>  	int ret;
> >> +	unsigned int reg_pwr_dn;
> >>  
> >> -	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
> >> +	if (qmp->type == QMP_PHY_USBC_USB) {
> > 
> > 
> > Sorry, all this code is unreviewable. Organize your changes in logical,
> > reviewable chunks.
> > 
> Will create new patch list and seperate patchsets.

Please respond to the comment regarding the single PHY vs multiple PHYs
first.

> >> +		struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
> >> +
> >> +		num_vregs = cfg->num_vregs;
> >> +		reg_pwr_dn = cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL];
> >> +	} else {
> > 

-- 
With best wishes
Dmitry
