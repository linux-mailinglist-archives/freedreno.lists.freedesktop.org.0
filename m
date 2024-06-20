Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C81911341
	for <lists+freedreno@lfdr.de>; Thu, 20 Jun 2024 22:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C097510E181;
	Thu, 20 Jun 2024 20:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z2hKFZ5W";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55B910E250
 for <freedreno@lists.freedesktop.org>; Thu, 20 Jun 2024 20:32:52 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2ec002caf3eso18942941fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 20 Jun 2024 13:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718915571; x=1719520371; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Yq0nWUsKxD4rK/v2NoFPmPbkAY476HU9+6IpUl30jWE=;
 b=Z2hKFZ5W4V5CHDRuHDpYLL5QM5TnYkeMzPZB21eFCkObOqRZYG5bIVtnE9DsITBFzI
 zvp8cO09dOFtJAw9K8b6q+8J55Dr0p/1ViXYpMcw1f0Fst+PF0DZ9wgrSUNIRzIvbq4P
 9UJB10o+zXUgLeEvs1g/KDIVANArSfKBNuX2IF7y8nVE68T2pZ1ovM8EiRv4v+uZA6is
 sJDbOvSK/QOwY4KdUs8ylhxyQyLFklhu7XwrLQ4lXLC6hEHUvT/RhLCsldCkNnsvVYLE
 fN5pT8uw2HhhqEBQpsyZ1qJ4tMVAV3oCDg9aeHn9GgdJtaqkIyrZf3vjg0bwrRhyMgAN
 Ie6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718915571; x=1719520371;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yq0nWUsKxD4rK/v2NoFPmPbkAY476HU9+6IpUl30jWE=;
 b=Qr8qgR9HxaZ0GQtd4R5DmqQsb+mBIt5tm1EfDDNHY6weaTMVM2YZG68plbpfe1nqlA
 HOt8c6On4X2G8HNrx2R5isLqG0ETYTC2+rFcqSaw3xrWN0Sqjye0RzytMOG6CxkCnan6
 OWS/lPs1fMtFHHYOsCQ5TPCvJs+TgTx9xat7dIAoaDvdc+gKFPsSswlzp41ecdhQXblL
 YBxQ2UxG027L+JQ64PI9EXnGV/BEYTR0I7qkF7O2WySYpGxEXBlWn3ONumr090uVrY4n
 EENtm/x0mw/4UsrM0S78MRSVnBlHpKdsaY9lp2GQvR1n2kkWVOLaW8FrNJSfIhyl8m0h
 Y5UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV44uzStmSA+J2XKYFa52WRd0ld7o3lIheHugXiNO4/3YRzVupT5Ugsmem5hJWMdLvse4IsAhT3G7lBmmtq2iNCfXwCDzrn//YnQ4cElC6A
X-Gm-Message-State: AOJu0Yxq8GW7nq9R2TdVMnj34sGZSk8X1L6kzaPW+elB7ya8B2mw95ZY
 ly1W46LvzxV+NAPSktMnfgxkDkBHrbDtVPkMQGL8YDytEyIDYBCzALqsgW7hf8E=
X-Google-Smtp-Source: AGHT+IHMpcwkT02hJ8steyoLT0MHFupFKcYGAIgPIehNeuT8A2kH+0oB8/Gv4eoKPRkoRs+Es9bF5Q==
X-Received: by 2002:ac2:4568:0:b0:52c:c9e4:3291 with SMTP id
 2adb3069b0e04-52ccaa5958bmr4931076e87.60.1718915570794; 
 Thu, 20 Jun 2024 13:32:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287b245sm2162968e87.205.2024.06.20.13.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 13:32:50 -0700 (PDT)
Date: Thu, 20 Jun 2024 23:32:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/9] drm/msm/hdmi: turn mode_set into atomic_enable
Message-ID: <xymopystyfjj3hpqes3uiw2g3dqynxzvz23snrbfzf2judgxnt@j4nmpcbuy7a4>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
 <20240607-bridge-hdmi-connector-v5-5-ab384e6021af@linaro.org>
 <f34c4210-fd59-9d27-0987-3345631c9e35@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f34c4210-fd59-9d27-0987-3345631c9e35@quicinc.com>
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

On Thu, Jun 20, 2024 at 01:27:15PM GMT, Abhinav Kumar wrote:
> 
> 
> On 6/7/2024 6:23 AM, Dmitry Baryshkov wrote:
> > The mode_set callback is deprecated, it doesn't get the
> > drm_bridge_state, just mode-related argumetns. Turn it into the
> > atomic_enable callback as suggested by the documentation.
> > 
> 
> mode_set is deprecated but atomic_mode_set is not.

There is no atomic_mode_set() in drm_bridge_funcs. Also:

* This is deprecated, do not use!
* New drivers shall set their mode in the
* &drm_bridge_funcs.atomic_enable operation.

> 
> I would rather use atomic_mode_set because moving to atomic_enable() would
> be incorrect.
> 
> That would be called after encoder's enable and hence changes the sequence.
> That was not the intention of this patch.
> 
> NAK.
> 
> > Acked-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 33 ++++++++++++++++++++++++++-------
> >   1 file changed, 26 insertions(+), 7 deletions(-)


-- 
With best wishes
Dmitry
