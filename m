Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 866DF91380E
	for <lists+freedreno@lfdr.de>; Sun, 23 Jun 2024 07:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59BD010E030;
	Sun, 23 Jun 2024 05:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RpZLgZij";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0ABA10E051
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 05:59:25 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ec3f875e68so36889271fa.0
 for <freedreno@lists.freedesktop.org>; Sat, 22 Jun 2024 22:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719122364; x=1719727164; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uV6ZdsyWs/0K8RTllxKQAwLax2534ZjABCMu7Optue0=;
 b=RpZLgZij5tqVGUPFfaUyh5xD4LSs1kzaAMyHsko7/Aj11nfYKyG6YJ2ziDZFl8IHzj
 bpWmgClTCk4njIJoar+TdW1KVc7xK0tPuFKV4AvTmtFH9f6H82vxH8u83FvaSEyztFPb
 GmuEF8TBG3EweCT3Vu0wgnT4fFBQDpfTiY1NspgFjknI6zGLXk/ijH6mMqZr1Vzvu63h
 VBXWf3PHJSPER8oqKPJtYlZJqJj36MLBhA99ovHxq3IN+HmnQOVgo9ARauEkkfjRYM4b
 tuzh6TRM6m3HFGPmRf2rH+plRlVJlf4Q4s7yS/ivU5pPGEPADNcho8Be/OgcsN5Do8I6
 Qhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719122364; x=1719727164;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uV6ZdsyWs/0K8RTllxKQAwLax2534ZjABCMu7Optue0=;
 b=HTZUnq0D5twcZ2YoM5k/1GHWl+pOpqRMuvsoQkwbsOnLCLDcl5q7NUmpICGXuXJ8df
 BX8NTjyPZcV57a5d8rtUtanf/plmN5xT0X5EFK6pqdp3uHa44K6wI+/AAJ+YXn8IWD4+
 Ddi9K8EKBquoW+E/Xjba4vy6ebQ1zIIHJcGUr5uhDhgCZ+mZ/7jFZFKQSjlS/JFJT/49
 DOPB9DQzhTNvF6tZP20EX1DqVTY+VcPsKWdLlJzZS9k/LthbPbX3Jo5a+CjcWqii1B/R
 o/pFgKSdb15frP9RWIB6GMOgQosSiEo5vcm9tQTQNn3xdMGz6tcCrOJIO7q/TQkbN64d
 Erzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVMOcw9pjfv+2Hk0O1MpRj5yZ98IPUrzLx/Vb7K8pPark5EPZH0m9fVUpdfuXAEA8aKynauAlNXDxmlu1KEfFWRWVhHBmS+iJ1WPfpwJIk
X-Gm-Message-State: AOJu0Yxhl4Us05SWGX0YTsZl6gRAE37tEK4IM22uwbUJgUmJ/y6V3/3+
 YHIy5syH5UIQn+QEuiXbivcxFS8QU5XGtobjf2uGWZkGsXOMqIf6IFi8RtXiUzE=
X-Google-Smtp-Source: AGHT+IGcHezaqPv4f6l+aRS6cpymyT8QWqnho+MGi0nRzclFQouvXc2Vz5OXXDqk0xU0di91OghoDA==
X-Received: by 2002:a2e:9f05:0:b0:2ec:fa4:e310 with SMTP id
 38308e7fff4ca-2ec5b3d48ccmr7355091fa.34.1719122363747; 
 Sat, 22 Jun 2024 22:59:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d60130csm6301061fa.13.2024.06.22.22.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 22:59:23 -0700 (PDT)
Date: Sun, 23 Jun 2024 08:59:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH 2/4] drm/msm/mdp5: Add MDP5 configuration for MSM8937
Message-ID: <hzslz54iq5sjmfhcbuj3my7cbjsu73acxeelih3jekr6rznz44@qie4c4w5lt2d>
References: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
 <20240623-dsi-v1-2-4ab560eb5bd9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240623-dsi-v1-2-4ab560eb5bd9@gmail.com>
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

On Sun, Jun 23, 2024 at 01:25:52AM GMT, Barnabás Czémán wrote:
> From: Daniil Titov <daniilt971@gmail.com>
> 
> Add the mdp5_cfg_hw entry for MDP5 version v1.14 found on msm8937.
> 
> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 89 ++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> index c5179e4c393c..6413c0d3e237 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> @@ -1011,6 +1011,94 @@ static const struct mdp5_cfg_hw msm8917_config = {
>  	.max_clk = 320000000,
>  };
>  
> +static const struct mdp5_cfg_hw msm8937_config = {
> +	.name = "msm8937",
> +	.mdp = {
> +		.count = 1,
> +		.caps = MDP_CAP_CDM |
> +			MDP_CAP_SRC_SPLIT,

Could you please point out the SRC_SPLIT reference?

Other than that LGTM

-- 
With best wishes
Dmitry
