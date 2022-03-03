Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E6B4CC90F
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 23:33:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BE910E367;
	Thu,  3 Mar 2022 22:33:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3B610E367
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 22:33:57 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id j24so6161010oii.11
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 14:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=lF0Dtfm5tuXnG8vTMCkjXhHNJyKSmMyJEFbODIk9Ay8=;
 b=hP54rWK9695Xv6Ax4gxz/Z0LyxkVeLS1cVuj+Db7e++0rVJLFrPRykRPG8sBya9xWB
 QVDQc9kZGQ/hBdMAZZcyqteJ2EWRSG2oiUOkVL0f38FyPYqTqDFbIIgwvcY6TjCpfmyT
 2Y3vLXbzh8+57i5lLQyGXbNpXCHzl1FVrx9oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=lF0Dtfm5tuXnG8vTMCkjXhHNJyKSmMyJEFbODIk9Ay8=;
 b=gkZ5f//ApEU63/GGoX+e2Ie4ZUjfHjpME8/LO2fO+fKuxVYjrwRDg7SVaSbIjSS8Fu
 pdi9MKFfzW6vx1peJEaF2yr+dhtNg74HCy4G7oFo9yccrLPH66dss7NRS/pS8ICrFs8p
 9YbOh+5lqbzCl28JuJ5UwNS6lMHSd3ok1Tz3udc5a4SCUjK1FvHBXKyJKQlfx+iVzZ4S
 +kAo7a8KvZ9grRtpFVSdf5+RAPHr1DKIVjRJtbzcLP+uzCxbp1L7UOLU3TtYh8akbcy5
 LlWocagMQ1RTGKMnYjhXdb6HXVVArajIrlczM0ZEI0cmRIRD5RRo6EiK2kTT3fED29SD
 rcoQ==
X-Gm-Message-State: AOAM533m6BKDrlwiDhDINApCquyJvscohb4xBPx4DLnG3yo81hFMB1Jb
 M0w3qCtUn3hsBhnvFhNlfwKaGqRu9S0AbSsHeTi+RzpdVE0=
X-Google-Smtp-Source: ABdhPJzgOEQ4DnlS7qHir2txR1YyHGHvpGpOujLYaX4vwlMWe2204uMruSrw8Lxh9lr5F/i7YbKW6Tr1Gwe+2d24nNM=
X-Received: by 2002:a05:6808:20a7:b0:2d4:d2f1:9edc with SMTP id
 s39-20020a05680820a700b002d4d2f19edcmr6674548oiw.64.1646346836818; Thu, 03
 Mar 2022 14:33:56 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:33:56 -0800
MIME-Version: 1.0
In-Reply-To: <20220217055529.499829-6-dmitry.baryshkov@linaro.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-6-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 14:33:56 -0800
Message-ID: <CAE-0n53fxr=-jT2LvbNsyTMqT4B9t9q=OzzmdMSdf7U0QJLNuw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 5/5] drm/msm/dp: rewrite dss_module_power
 to use bulk clock functions
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-16 21:55:29)
> In order to simplify DP code, drop hand-coded loops over clock arrays,
> replacing them with clk_bulk_* functions.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
