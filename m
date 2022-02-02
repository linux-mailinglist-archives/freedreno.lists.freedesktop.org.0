Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 435204A78BB
	for <lists+freedreno@lfdr.de>; Wed,  2 Feb 2022 20:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B372010E412;
	Wed,  2 Feb 2022 19:32:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE79F10E317
 for <freedreno@lists.freedesktop.org>; Wed,  2 Feb 2022 19:27:15 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id c6so1802031ybk.3
 for <freedreno@lists.freedesktop.org>; Wed, 02 Feb 2022 11:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MVFg7PnzCZUjUxdz0W83GsH6V6lHk0PTdYLQqbtG0AI=;
 b=VUwYV4hfYIJDeVqAbdSVlM+Ob6/tQmaK18WXFHl50OmP56SqFl78RfzWXIZAhDIEyA
 FBxi54PA6BaxdknZcdX6mGVwGAs5r4L/o1yfQC6tIb41idAtlSuLxodwGODXpdQYAoou
 gBYie3P3VedP1Q6B4Vq2tVEMo6OFvTZeK3j/8lCY2iRXtpCT1496pzBfM88SpAwUnR0v
 UejxgXYvo3gN1ViXSbsqRVrvbwtcYBPz5h9Qvvh/PT5PICdBHwABLDDpHlb87s9G/l6Q
 ExTcmFgmDUt5xNa5ZXPbgdrJftgwB8u6PIPXqmWn+Veh7T2F047aQbSZ1SEBqoDhU1wI
 bB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MVFg7PnzCZUjUxdz0W83GsH6V6lHk0PTdYLQqbtG0AI=;
 b=nMpVRanj2w+is6gwK2ZxWR/7uTrLY6BFpnYOb+B+S6QMJGIb4xiQ+P+hDRMVOC7jnk
 FIfVpNSGu7HpK4s0Jhg8K9kLICTth0KOoMAKpfA0oMU4vnQUTobulGTxbN7428ZZ1gjw
 k41OhNUXLWQ8bONfzZEcJN4mbRKRuhU1Ms1ll+EDzEHyHI6vHVsoVWcew0+9LxumaYtt
 0fxmbSsZGLQc4Vab8xcsH2wnTcc07RexuG9T6PpH55jAvZHVenmqJcn6njgKDv0bzwAy
 qtupTDUriNEafRvYxtnksspvgwy26EOmkcETq/BtCXEL+vwa1jJQZkjOW6bACZI3UFc6
 UW4g==
X-Gm-Message-State: AOAM532bMKsLD4zUbxBYBcYu3lvGJbVy7C9wdIySCab9eSryB8DdPlMg
 Zdrze7+o1AgsrN3bKlrNI9qRwUN11ft+HmUphgnyGQ==
X-Google-Smtp-Source: ABdhPJxjEkuDFLTtBXShgD0F0o0g/RNgC7ua+FWLePsV5R9uG8DZdnnVQ8u6OGlpCZe3rRIYPAUwctTIuW7JqlAHdlI=
X-Received: by 2002:a81:23d4:: with SMTP id j203mr2147372ywj.95.1643830034776; 
 Wed, 02 Feb 2022 11:27:14 -0800 (PST)
MIME-Version: 1.0
References: <20220201161618.778455-1-robdclark@gmail.com>
 <20220201161618.778455-2-robdclark@gmail.com>
In-Reply-To: <20220201161618.778455-2-robdclark@gmail.com>
From: Emma Anholt <emma@anholt.net>
Date: Wed, 2 Feb 2022 11:27:03 -0800
Message-ID: <CADaigPUcA5+o2Cd+1YYTGbpnsj3Di=m2Q25OUeumz0HAQVFc9w@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 02 Feb 2022 19:32:16 +0000
Subject: Re: [Freedreno] [PATCH v2 1/2] drm/msm/gpu: Add ctx to get_param()
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Yangtao Li <tiny.windzz@gmail.com>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Yiwei Zhang <zzyiwei@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Feb 1, 2022 at 8:16 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Prep work for next patch.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

> diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
> index 7e4d6460719e..dd3605b46264 100644
> --- a/drivers/gpu/drm/msm/msm_rd.c
> +++ b/drivers/gpu/drm/msm/msm_rd.c
> @@ -197,13 +197,15 @@ static int rd_open(struct inode *inode, struct file *file)
>
>         /* the parsing tools need to know gpu-id to know which
>          * register database to load.
> +        *
> +        * Note: These particular param does not require a context
>          */

Minor typo fix, "param does not" -> "params do not"

Other than that, series
`Reviewed-by: Emma Anholt <emma@anholt.net>`

and I love that we're catching non-address-space associated faults now, too!
