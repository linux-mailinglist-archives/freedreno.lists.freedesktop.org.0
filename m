Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5A0486E86
	for <lists+freedreno@lfdr.de>; Fri,  7 Jan 2022 01:16:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D932710E6D6;
	Fri,  7 Jan 2022 00:16:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3839E10E6D7
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jan 2022 00:16:38 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id w80so6035168oie.9
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jan 2022 16:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=AhAOsZ/7jHs5SUsagnpCXuv8mziNMy8lNAe5OxNHwRI=;
 b=jtu0UCzsfvv7r/9Ui35y3wcCDJ3CTyXCC8ChvPsXCS9J3W37m6SMoBTQbsj+ErtfE9
 pe0aHLL5ZWI9rFnxE5JXD20lz7HQ5hXDUeTh2khVn4BFwqA6b1gU7t/PkpRjvVqM6VpH
 u3uv0WnE20bi241CKaAwLaQZj5rAyiY2wkRUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=AhAOsZ/7jHs5SUsagnpCXuv8mziNMy8lNAe5OxNHwRI=;
 b=Dyh7zqoC4N5q6k7mtdtitMBBoCJ3zTjazElMJmMxc8Qeg+3YeRyNVLQFsk3UL75fIA
 JBL74CQMDqW+gYYLvXrul/HQ63ENAEF9GQT6i72kAhCnXmmHorBP9jk+9zD+rTIQDsc1
 caAMHkx/j9rtXBSWm4q9dXj3Nk/+5JK3DoUso7VG0ZE7lZor46yiK5VICJZn2is7b/fe
 M3pMKlEM6SVBHC4nWztnGDTVDJUnpFcfoiJiDMgOLYpz+HhQg563Ql5F5VWYdOLeZhKS
 P6mhBSINORgyW4Cuexbk2xTkazMTNltlwve0NCPffEDA1LtzfuSoDVIuukh/tIV+RPx2
 9muw==
X-Gm-Message-State: AOAM530A+sNS58GigsZczvasPH4tvgzQEhNAistrDa5iU5qUj2pmCw7e
 8PaJl16N1bHunSGwQ6f8RzOUTAFLp3uF2MKvno1vZA==
X-Google-Smtp-Source: ABdhPJzdnu0U3lCEWw7wwT5P+wBqtXsBtwXolcxsJQLEGILR/MbyPZuk7wEfhLzqqaqCXLmimPsFv6cKTyObVMLoGMs=
X-Received: by 2002:a54:4710:: with SMTP id k16mr7970018oik.32.1641514597511; 
 Thu, 06 Jan 2022 16:16:37 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 16:16:37 -0800
MIME-Version: 1.0
In-Reply-To: <1641501894-17563-1-git-send-email-quic_khsieh@quicinc.com>
References: <1641501894-17563-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 16:16:37 -0800
Message-ID: <CAE-0n51WQMSeChCyMKCHOGSqhGKf4=TamDinndrF8iVFrmrZ7A@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4] drm/msm/dp: populate connector of struct
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-01-06 12:44:54)
> DP CTS test case 4.2.2.6 has valid edid with bad checksum on purpose
> and expect DP source return correct checksum. During drm edid read,
> correct edid checksum is calculated and stored at
> connector::real_edid_checksum.
>
> The problem is struct dp_panel::connector never be assigned, instead the
> connector is stored in struct msm_dp::connector. When we run compliance
> testing test case 4.2.2.6 dp_panel_handle_sink_request() won't have a valid
> edid set in struct dp_panel::edid so we'll try to use the connectors
> real_edid_checksum and hit a NULL pointer dereference error because the
> connector pointer is never assigned.
>
> Changes in V2:
> -- populate panel connector at msm_dp_modeset_init() instead of at dp_panel_read_sink_caps()
>
> Changes in V3:
> -- remove unhelpful kernel crash trace commit text
> -- remove renaming dp_display parameter to dp
>
> Changes in V4:
> -- add more details to commit text
>
> Fixes: 7948fe12d47 ("drm/msm/dp: return correct edid checksum after corrupted edid checksum read")
> Signee-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
