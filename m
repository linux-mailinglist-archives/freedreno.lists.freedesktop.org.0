Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8EB480CA1
	for <lists+freedreno@lfdr.de>; Tue, 28 Dec 2021 19:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE4C10E3AA;
	Tue, 28 Dec 2021 18:49:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCDC10E3AA
 for <freedreno@lists.freedesktop.org>; Tue, 28 Dec 2021 18:49:43 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 w15-20020a4a9d0f000000b002c5cfa80e84so6303887ooj.5
 for <freedreno@lists.freedesktop.org>; Tue, 28 Dec 2021 10:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eXhwfFLm6xuRXH07dJ43yJ+pTlr8xJ8+NlyVlndnfCM=;
 b=tsMCTyQL8yJvHEdjhTZNmLbJ57UAa8DmU4t+AJIjvr371gGhUD4TpfUfYQ+wQ74Imv
 GaoTxx0a03liOrWDFTeLIJCz1QWWvFJ0G6VIj7rkBgnwyPISmapj8NcRCURqS5IQ7I/b
 h8pLQWqR15McqilHIGRd9jtVaklDqDJRvrIC5hueGCx4lw0QBN/tFoe4Hbp9z4QxCkb5
 C1seEJxP7fvY6+cfZh4ZxgXtihTJjJP5yHQfR3pcueda7gQu0CypJ/kHPJVXWCsbN7hB
 iOezJZgrSR1fEP5Y+xvs8FkNRG0xJcHg6n8H/elrrOeVVr+F83OilwPLezSr1XU7Kha4
 t8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eXhwfFLm6xuRXH07dJ43yJ+pTlr8xJ8+NlyVlndnfCM=;
 b=fa/g6K9KfXNNwsZ2TQN+MSo78rnVEugI3lVS3hTWcBy8fyUXLGz+pGlUG7aYqp3I8v
 N1GP6IspJ9VOq8ezPv8tQ2XoWb3KsT5fO1ZS62/JI5yW+aetUdGra6iqfIyBNmoDHSgd
 /EHMr0FG9AoKl8qowGKqxs0fiYCDjm3ZOLr6Xr4VjrF9yPTt85ly0ocndxd+g9y6i5+U
 tmoZJ6pYToNs4tys+N1RpkBla63lZk7axXcQkA0d1XTCf98nMHLJS/CIDDhUZQc2rXJL
 YjRWOnJZKJlTOfkI90hwJOm8fQZ2TuyG1VU8Df+Or17zfMrbfX152nzhvX1NxYPtYpJB
 8IOA==
X-Gm-Message-State: AOAM533NqDfJ7RN5A1SVj/UxZNm4cR+qITNscsMkF6YkavH+y9NpVIKP
 NSKxfeWGQ0YVw2KmDE5xQCjgGA==
X-Google-Smtp-Source: ABdhPJxFcz2lm2/hfGgOO3cwto/v7M4ze2hWUHK5rd5mQN6CYOKVEj4fK2UGpbvGa7fyTR5s1kvLFA==
X-Received: by 2002:a4a:a4c9:: with SMTP id c9mr14129371oom.21.1640717382428; 
 Tue, 28 Dec 2021 10:49:42 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id 90sm3133883otn.59.2021.12.28.10.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 10:49:42 -0800 (PST)
Date: Tue, 28 Dec 2021 10:50:42 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Message-ID: <Yctcgslq283lZXW/@ripper>
References: <1640713908-7453-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1640713908-7453-1-git-send-email-quic_khsieh@quicinc.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: populate connector of struct
 dp_panel
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 agross@kernel.org, daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, aravindh@codeaurora.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue 28 Dec 09:51 PST 2021, Kuogee Hsieh wrote:

> There is kernel crashed happen due to unable to handle kernel NULL

It would be wonderful, for my understanding today, as well as people in
the coming months to be able to search for the callstack etc on the
mailing list, if you could provide some details about the crash.

E.g. a callstack or description of when it happens.

> pointer dereference  of dp_panel->connector while running DP link
> layer compliance test case 4.2.2.6 (EDIDCorruption Detection).
> This patch will fixed the problem by populating connector of dp_panel.
> 
> Fixes: 7948fe12d47 ("drm/msm/dp: return correct edid checksum after corrupted edid checksum read")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 71db10c..6a938a2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -197,6 +197,8 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>  	kfree(dp_panel->edid);
>  	dp_panel->edid = NULL;
>  
> +	dp_panel->connector = connector;

So you have a dp_display_private object with a panel and a connector
allocated, but before you manage to associate the two you get a HPD
event and call this function, so you decide to stitch the two together
just here in some piece of code unrelated to the initialization of your
objects?

It sounds like we're lacking synchronization between the initialization
and the HPD interrupts and this would not be the correct solution.

Regards,
Bjorn

> +
>  	dp_panel->edid = drm_get_edid(connector,
>  					      &panel->aux->ddc);
>  	if (!dp_panel->edid) {
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
