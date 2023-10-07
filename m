Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BB77BC72E
	for <lists+freedreno@lfdr.de>; Sat,  7 Oct 2023 13:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A9E10E042;
	Sat,  7 Oct 2023 11:35:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F1A10E03A
 for <freedreno@lists.freedesktop.org>; Sat,  7 Oct 2023 11:34:59 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-59f4bc88f9fso34557227b3.2
 for <freedreno@lists.freedesktop.org>; Sat, 07 Oct 2023 04:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696678498; x=1697283298; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jSGXM9PaTj8Iqla8u7waxHlJMDX8neA9/CvBL3oU1vs=;
 b=wWsHRETh33sAxw51WMj2HVIFqRzBZKD376ul1aPX4FiJ1HJeYngsyMdbeQrcQ7QMhv
 arjwgcgejGfm7dnr7xZbibd+PcCDp9/8iyhtruIWWuCSnPEsQyNMf0Vi0Vtbe52v5yhs
 23k1JjpichvIN8IYaEvTxdW/an/6/JRmyc7ygUdIiHG0o81HDV/ZRz6A7SwvGIPyeVvI
 IEbvSOxgNkexyMsRDRqgpicRPthuUJD8JlPTXcj8pM5EtB+NG8KBtZEsbYNIU7eCmzB4
 klZmwAnQ6hV0ivBMkl/aL7hwOow2v/QXyPCz5FNGSglzw7Lgo68sHssqlwyOVDXErq/t
 9EYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696678498; x=1697283298;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jSGXM9PaTj8Iqla8u7waxHlJMDX8neA9/CvBL3oU1vs=;
 b=NZToSfFcz+olk4fm0p5OKJ6tUKRax7R4SyLDpuWfUHr5axce5UK4VPBKJzU8z3VxUf
 YRCMmj8TusyRJp6/9CJhnwUORhmsEjhaB850Itw6dLbsVl7XZf2xQUODOKwq4NsZ5mYH
 cJRvKOZhsboi2py4ldfTywjmnOKnjUHRqyGbKrujSu/0rQOJTB07xWx81CKVJRCkIfFX
 tgUTRUW+Aeh5fnOeLq5V3Sx39Hd+tK9MWVeBi6pyhbHEz4C+Eflomf4eqVq6NSQT587X
 LtsKmnkcOZjtIRy21zatb6M0UH7huNgQWWz4Ku+ln/zDe8/7UTtmlkI3tVgY3oSiiBJ3
 rTUg==
X-Gm-Message-State: AOJu0Ywa9Y6Xu6Fgo1tixXGepXXg3CZ2sRgUwk6Lu46TSLTXa0skQNvG
 XhWx1iKS55B38FEJ42qIT0fouPO/caR09gdwyVgMWQ==
X-Google-Smtp-Source: AGHT+IHKG97Lbeo+UsrdR1nmTFCgOqLGW2T7I5kZ+QxpgcEZM+JxKgbJ1VtzfFGONuwMVUMAzhcrWeC5dW14K+7atQ8=
X-Received: by 2002:a81:7b8a:0:b0:59b:c805:de60 with SMTP id
 w132-20020a817b8a000000b0059bc805de60mr10110241ywc.45.1696678498310; Sat, 07
 Oct 2023 04:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com>
 <1696632910-21942-5-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1696632910-21942-5-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 7 Oct 2023 14:34:47 +0300
Message-ID: <CAA8EJpocnfaoJ9syC8YahfwgRad7sCEhJx_njEVpkY66HSMvOA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v7 4/7] drm/msm/dp: move parser->parse() and
 dp_power_client_init() to probe
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, airlied@gmail.com,
 andersson@kernel.org, robdclark@gmail.com, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 7 Oct 2023 at 01:55, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Original both parser->parse() and dp_power_client_init() are done at
> dp_display_bind() since eDP population is done at binding time.
> In the preparation of having eDP population done at probe() time,
> move both function from dp_display_bind() to dp_display_probe().
>
> Changes in v6:
> -- move dp_power_client_deinit() to remove()
>
> Changes in v5:
> -- explain why parser->parse() and dp_power_client_init() are moved to
>    probe time
> -- tear down sub modules if failed
>
> Changes in v4:
> -- split this patch out of "incorporate pm_runtime framework into DP
>    driver" patch
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
