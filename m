Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF41A47615A
	for <lists+freedreno@lfdr.de>; Wed, 15 Dec 2021 20:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D93510F84A;
	Wed, 15 Dec 2021 19:10:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B67510F84A
 for <freedreno@lists.freedesktop.org>; Wed, 15 Dec 2021 19:10:35 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id o4so33042539oia.10
 for <freedreno@lists.freedesktop.org>; Wed, 15 Dec 2021 11:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=o4GFUJfnOn1MqDWBxKCcYXZhEN4oa41+4/hNAuhMnEQ=;
 b=FDnhrOp05KzmGqeixp4fuYb6yNyFnun02Y9PQN9byiYvDKsyxwM1injIQXFUyzVn9V
 MSvrGkVCX8251BsU+94oW9TYQiiL/ePZhhqB9PpQYiv9AbyREhBGlC7AGo8FCClTx6sb
 PSJUfLRM+Rq1QNw59ufxqempEPKQijigi3K5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=o4GFUJfnOn1MqDWBxKCcYXZhEN4oa41+4/hNAuhMnEQ=;
 b=E8MwMPlLd2IkUSgTha3Ybx034A9bUG/rYdogCy1MwHRfgKw7F8ZAQ5rz1VW3nm8rVh
 B8riGdO0vdyr70fX7jLv+UEWu7gGJA/5vMnCSVRJ7lDnOwtI/ifpTqITvSyYaM4DV+gm
 6P1AD/Uk2QIGHpXrGIRWPBOto3HSZCdQlD5TmrJ7hOVWkZyTSn7E+j0MNVKAfVtsJ748
 liUkft7++uweTvcUcVKHizGJLLO+6FhxjG/VDsAZ3SFLLlYrhxirZ1THKoXH6GgXxSZ+
 NutO+lgdn0Xute2eTV7IdMRv/Rkqe0rGBomhBxwtgkhKG2k8BR4/L00Y8n/GSEO9+uvg
 Zo0A==
X-Gm-Message-State: AOAM5300/wZVAv48P4tdO2U+Fpx1iHsXXaxX4JjYIqqk3Nmp6Sm1sU32
 SU+EJ9QRsrYO7OPuK0yevJzR685u/5H6I3dm0Cl09w==
X-Google-Smtp-Source: ABdhPJylPPGqcI6i5Kd0ZwAXgrXkSHaQcXt5Yx/hOTY43OO1Fv2rztkYwFETiHyR1NlHtEbQThfQbHh0h6fpGYQHPfM=
X-Received: by 2002:a54:4506:: with SMTP id l6mr1230341oil.32.1639595434600;
 Wed, 15 Dec 2021 11:10:34 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Dec 2021 11:10:34 -0800
MIME-Version: 1.0
In-Reply-To: <20211215175910.1744151-1-robdclark@gmail.com>
References: <20211215175910.1744151-1-robdclark@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 15 Dec 2021 11:10:34 -0800
Message-ID: <CAE-0n52CHwYAEwAC0Hthgbamjj2x4K3B2w=kTRw_AFLzVgDF-Q@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm: Don't use autosuspend for display
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Rob Clark (2021-12-15 09:59:02)
> From: Rob Clark <robdclark@chromium.org>
>
> No functional change, as we only actually enable autosuspend for the GPU
> device.  But lets not encourage thinking that autosuspend is a good idea
> for anything display related.

I'd prefer to see a small blurb about why it's not a good idea to use
autosuspend for display things. Then this commit can be dug out of the
history and someone new can quickly understand the reasoning behind it.
Just saying it's not a good idea doesn't really help.

>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
