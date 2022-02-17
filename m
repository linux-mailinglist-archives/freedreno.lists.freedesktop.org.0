Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9531A4BA9E6
	for <lists+freedreno@lfdr.de>; Thu, 17 Feb 2022 20:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DF510E206;
	Thu, 17 Feb 2022 19:36:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB1A10E733
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 19:36:37 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 l12-20020a0568302b0c00b005a4856ff4ceso439265otv.13
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 11:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=H+l6hsd+n/fdXKs16VSP4q/PbtQuMzGtJT4cgvfkyLM=;
 b=TFS6wlpWxxfiSvxGIJT5wKWz8pYgNIlYtyrOibWyZ+S/iJaoGCQre53jIw5wLhCoob
 DMY/KuX/4BN7wh9Zi9o7iO0x06vdpsMf7L29hiurIB4sWLyndkE68bUK7GewspaLaqDi
 0ZSe0caSnelzPSVH1HIECXuzTI4WwvijpBa00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=H+l6hsd+n/fdXKs16VSP4q/PbtQuMzGtJT4cgvfkyLM=;
 b=IMRFQsLY+5X/iU/shm7YfpwR6RzrVy4RyxZedLT33RlOmCGeVrDZANdB/EIyYlrGGq
 KOYCvFEB1AnmkijyTL4RLLAKh0rckbpKUBlvhfCDd8y5CRJewiX7LeeP4ty3Xwk7fjSF
 VWcIo68/vueb9BRHE+X9wyJWLWSuQ/b/7URQKO3oSqI9aZMtS9mtw8cau5j+ODrQe7M4
 tdT+8CYdcqbqADzjQeHA2iSyzIpmLhzvJlqSt7uSYcooeu+OGid3URTEfoQA+C+DPxOq
 Dt3Vup65Hv0V6/OVtyTL+izbaBqsyZlirE7lSzGiAz8RZWXz6In+8dJXhgZxE+wzjNgi
 g9ZQ==
X-Gm-Message-State: AOAM5318nmFVzaIyjANLwxNnrQdWBC6Jw0b0XN0GFKFTUoKZrO4tSQ7w
 3LX3Tit4Kb0dzGalC1wP5Vep/gSL/24NDB2D94LXnw==
X-Google-Smtp-Source: ABdhPJzCvdEu8Ryr/y4DCzdw3lIqkwqkZu7z2hNcjMQo26YSTG5Hasgkw13cOP+fiQjDeEpiazhD4HoKhTitptumMTA=
X-Received: by 2002:a9d:7687:0:b0:59e:da8c:5d32 with SMTP id
 j7-20020a9d7687000000b0059eda8c5d32mr1419683otl.77.1645126596435; Thu, 17 Feb
 2022 11:36:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Feb 2022 11:36:35 -0800
MIME-Version: 1.0
In-Reply-To: <1645122930-23863-4-git-send-email-quic_khsieh@quicinc.com>
References: <1645122930-23863-1-git-send-email-quic_khsieh@quicinc.com>
 <1645122930-23863-4-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 17 Feb 2022 11:36:35 -0800
Message-ID: <CAE-0n52cz6JibgsJ4MWsdGhAjxHa6en+JbyKjKHVwQDnM8-5Og@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 3/3] drm/msm/dp: replace DRM_DEBUG_DP
 marco with drm_dbg_dp
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-02-17 10:35:30)
> Since DRM_DEBUG_DP is deprecated in favor of drm_dbg_dp(NULL, ...),
> this patch replace all DRM_DEBUG_DP with drm_dbg_dp().
>
> Changes in v4:
> -- replace (strucr drm_dev *)NULL with drm_dev

Why can't the platform device be used?
