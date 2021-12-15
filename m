Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B164761BE
	for <lists+freedreno@lfdr.de>; Wed, 15 Dec 2021 20:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB3110E583;
	Wed, 15 Dec 2021 19:32:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B1A10E583
 for <freedreno@lists.freedesktop.org>; Wed, 15 Dec 2021 19:32:03 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so26200100otl.3
 for <freedreno@lists.freedesktop.org>; Wed, 15 Dec 2021 11:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=37iLZzDUpFh5yORXA/4h/zBCNj8hCkym8Zzk5p+f3PE=;
 b=KGFIaQru2Z19Fmrep8ZJB8Ug70QxNjXcSZBC9ySdiB7y0R5J/rUIYeqUE67vFDJqvr
 GB3AUtYVg4qOKdLO7Uy0oyOoy6THle1C/SCD4wAcVXwNfFBKdMQh5qqV2TuB0Q1sLdUI
 dxOmRcUJHEMtJicpaqLlDOLjPr2Dxxzb7QmyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=37iLZzDUpFh5yORXA/4h/zBCNj8hCkym8Zzk5p+f3PE=;
 b=3XbdgSYILE3sYk6SqyWfFwCIoldzfoiFEC3Puoo6UysleRrwiSiuqTTTfaEz8wpotr
 QXlfwOMXYy2bVfsBYjcJyu8+54Wlh5DgxwtSUw2q83yW8vEcqAJ3j7GTzbULJru9Opyp
 e0PBaD0c8Z7FHVwmGzsFEo5NHkEoQSL079bFWgikdzHqpUoRyWsJB3V7SalViF2y4XF0
 dt5TTuia10vMBgE3JR9KjkgbpOWCT6sdjFY9ZWkgaYAMAEa8kSu9CqNuw/wdwUc7JS0x
 K3xhkoTFFddKegiYYFX93Gtp0Kma4lA32Q2Ios1ikxyfuIw8ehKyBpRGbfIaC8MOM05+
 28UA==
X-Gm-Message-State: AOAM533J7/4EFZE+JMNSd8KMkXZ48HNNdtzUDl81fkCp7KJLozcxwnRb
 Hc6lISMb31vLe3mGUmMlynlvkxq/aJgEIirtgO2Nog==
X-Google-Smtp-Source: ABdhPJzehPr4Sd3IcF6mQ4BKkC++SK1JfZHU7wf7hmX1chD30TtsGgjUypAGJhCV+gaGtHafUqQwKCFzsRf7S1FrRLE=
X-Received: by 2002:a9d:2243:: with SMTP id o61mr9964550ota.126.1639596722789; 
 Wed, 15 Dec 2021 11:32:02 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Dec 2021 11:32:02 -0800
MIME-Version: 1.0
In-Reply-To: <20211215160912.2715956-2-dmitry.baryshkov@linaro.org>
References: <20211215160912.2715956-1-dmitry.baryshkov@linaro.org>
 <20211215160912.2715956-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 15 Dec 2021 11:32:02 -0800
Message-ID: <CAE-0n51RCjyj=CW6Nz-Ei7kmAe2t-jKmZ5RbhFNfqDZ9V9gPsg@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/dpu: add
 dpu_plane_atomic_print_state
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

Quoting Dmitry Baryshkov (2021-12-15 08:09:12)
> Implement plane's atomic_print_state() callback, printing DPU-specific
> plane state: blending stage, SSPP and multirect mode and index.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Same const comment applies here

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
