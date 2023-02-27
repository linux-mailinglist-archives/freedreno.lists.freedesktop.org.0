Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 324BC6A4A64
	for <lists+freedreno@lfdr.de>; Mon, 27 Feb 2023 19:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D72310E20B;
	Mon, 27 Feb 2023 18:58:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4FE10E20B
 for <freedreno@lists.freedesktop.org>; Mon, 27 Feb 2023 18:58:34 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id m6so9907497lfq.5
 for <freedreno@lists.freedesktop.org>; Mon, 27 Feb 2023 10:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1677524313;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=mRsKipwTaZMto6Q2Ot7ciKaa6dv/XDA9FjOe0TQ3/no=;
 b=CWY8U8jhOLvKLGkjkUZAnFg/LXI2S72CxNcC4mseTG3U+TTx9Q5iV8VDC/vHHgetCt
 7nf6bVU0rOsbFKGxFNWOcmhFydzbKSMmv5VOz/qhVWPLegkUtoqaYt/+Hm2zkMkI9STQ
 NWNwVcjlaS9Ad9Ievzi8T0kPu6r3rkdRpusjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677524313;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mRsKipwTaZMto6Q2Ot7ciKaa6dv/XDA9FjOe0TQ3/no=;
 b=Kkm1Doild0h/NGYQnOBjLfUIj+3qnxojE0JzTf1j0EPD9tx7iair5WkEE4svyGMGmj
 HzyBbKjLfJVbV9hvpdwc4GP6zClLmHwG43Ym80VwzJIg6LWseWZDd4ycpgwrtW6P6LzQ
 uvrg5xKxC+prPYvAtnsZ4CL5gFErxl7WzaTXU8hkklEtQZsg1/t10KtGqXf5cZYQBVD4
 bifaBMu6hRWz7mPNgUnaFgCplcqI5qoAPD/uCbFbQH7UElliO52tPIgSN2Plnlcxa3nH
 6B3wDc5ZnEfVMW0Xw9G6B04voS3XrDxCqdHR68f338GoD7UJScBJNy+1q2xkCZP4SR0z
 VXDg==
X-Gm-Message-State: AO0yUKVf6Y/1ztnQb2GPQrk0BRbl0Yfd1v4kbhQ90Jy8OmeyuF/6jVQa
 BAcBz8hlardTJwJLzIvGz6SjEeiHKQ5LYA2adZ7lwA==
X-Google-Smtp-Source: AK7set8yKCM21HLcQlsUeT3bM88VXuBEcNpQS27/Aqoe0Fk8QBAzE2fMXsBi+t9fzPuZdWk9BMd16KTdWDB18VP6Ywo=
X-Received: by 2002:ac2:520e:0:b0:4db:1999:67a3 with SMTP id
 a14-20020ac2520e000000b004db199967a3mr7871179lfl.13.1677524313029; Mon, 27
 Feb 2023 10:58:33 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Feb 2023 13:58:32 -0500
MIME-Version: 1.0
In-Reply-To: <1677517471-5947-1-git-send-email-quic_khsieh@quicinc.com>
References: <1677517471-5947-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 27 Feb 2023 13:58:32 -0500
Message-ID: <CAE-0n51tvrbr1f2cRz4pCE-LMPjn09wXTAuiB9D_QeiF65pHVQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
 airlied@gmail.com, 
 andersson@kernel.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1] drm/msm/disp/dpu: fix sc7280_pp base
 address
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2023-02-27 09:04:31)
> Correct sc7280 pp block base address.

What goes wrong if this is left unchanged? How important is it to fix
this? Does the display fail to work? Does it fix something for a new
feature that isn't yet enabled upstream?

This information is useful to put in the commit text so we know the
severity of the problem that is being fixed and so that maintainers can
understand the importance of the patch.

>
> Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
