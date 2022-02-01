Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F534A55B2
	for <lists+freedreno@lfdr.de>; Tue,  1 Feb 2022 04:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A83B10E740;
	Tue,  1 Feb 2022 03:51:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B7910E73F
 for <freedreno@lists.freedesktop.org>; Tue,  1 Feb 2022 03:51:42 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 q14-20020a05683022ce00b005a6162a1620so2239269otc.0
 for <freedreno@lists.freedesktop.org>; Mon, 31 Jan 2022 19:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RwCJ9hsr7K8u4lScvyqLshgsHaCbHyGZzuvtWtgyQhk=;
 b=W/QeLuCExljnv+CgrUxbXAs3XEeKWZ8rl6XrNIq1eFyWpdrTb+tFCq3TopqOgLpk4m
 B0egCwsR8NYgiW3xtg8pT+VdahFhPJYh7zIOaB2oqy+B9/ac8BeN7pLfY5sKT2nc93aU
 6jX0n3f4Z7rpaOFLQdVWswntJe2MvkaNK+vFyKYzhLFcwcbqoS056ui8qZrDju+3GZbe
 R1p/YAzPyXaBwcHwZApsp5Or+JeU7CNJ8WGt5XdSSMt/Ljp6MYAMtVkLJqeJZ2GXQJsC
 EL36wmFdryie/kaqRwmRZ1rzOAdo5jKBEJ9BS0w64YQFpRaEaB+bNQgbdPHK1DJPtF2W
 FFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RwCJ9hsr7K8u4lScvyqLshgsHaCbHyGZzuvtWtgyQhk=;
 b=zoCato3myzPEFNrzedzUhRRwfGtPyiCio2rHcQz+gWFDaIelRQamap/nqpxH0Fxchn
 6SOOoaO5GsWzYkwl+Tg326gL5s0DzRNsGykZsJPCE0vkCBgB4gGzEkeCkMuQqUsGCO3C
 W4L1YJESYRZhc9jJQFIxKIO6/8mhnEVjpDW7458+jYH8W2AT3eGf1ERq9MHrPA+wQmMc
 per+avcOo4Uf1pTsXmQtwrh7IL9O/Lojp59/qWIz8BPXnOg+xCwHiHycNx6Crh3VT8H9
 aPge8u0eQQUxeCGJLblAEHJlVBo0abk1xYH7H1IsGQcZgcdZu/KLb86+sO5yNy/sURNp
 NJ8g==
X-Gm-Message-State: AOAM531KJVPZr3JqpmtXoyEjdVEJjSDgDiIwt4CL+fid/aSA0vyPOPkf
 a0fFzjysPKtEtHH4omQV+3t0kA==
X-Google-Smtp-Source: ABdhPJzlVbKkZvspjBMNPX/2jwwSYJ4UGETyWaSGL5Z6yUDRuLU1XIP91aNhSXJlSr73jp6k3OJsKw==
X-Received: by 2002:a9d:d72:: with SMTP id 105mr13424096oti.340.1643687501469; 
 Mon, 31 Jan 2022 19:51:41 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id y3sm16901825oix.41.2022.01.31.19.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 19:51:40 -0800 (PST)
Date: Mon, 31 Jan 2022 19:52:00 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Message-ID: <YfiuYFCONqRzv3Mk@ripper>
References: <1643390945-10813-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1643390945-10813-1-git-send-email-quic_khsieh@quicinc.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: add wide bus support
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
Cc: quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 agross@kernel.org, daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, aravindh@codeaurora.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri 28 Jan 09:29 PST 2022, Kuogee Hsieh wrote:

> Normally, mdp will push one pixel of data per pixel clock to
> interface to display. Wide bus feature will increase bus
> width from 32 bits to 64 bits so that it can push two
> pixel of data per pixel clock to interface to display.
> This feature is pre requirement to support 4k resolution.
> 

Can you please elaborate further how this is a requirement for 4k
resolution, given that I write you this question on a 4k monitor.

Regards,
Bjorn
