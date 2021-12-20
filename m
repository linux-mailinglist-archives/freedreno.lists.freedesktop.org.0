Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D87347B64B
	for <lists+freedreno@lfdr.de>; Tue, 21 Dec 2021 00:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F59210F365;
	Mon, 20 Dec 2021 23:53:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DF310F365
 for <freedreno@lists.freedesktop.org>; Mon, 20 Dec 2021 23:53:18 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id m192so11008280qke.2
 for <freedreno@lists.freedesktop.org>; Mon, 20 Dec 2021 15:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NcXgqI6cxpe0e91iQv5hDRD0JOXrVC93a0bIwF8hPSM=;
 b=Ws1YkYkUr9UQiyjkjzcDfhUOL2xPU099pRZc/DVWPUqgSkTISCxkmbTnZUDKAzLfWA
 rXurwah7hW92RHgf4AfGporMV6jEGkWvykl1RhJbiY6Z31s88Vn+zEc35OMnbIZYeSP4
 CepC8EGG3Wii+57keP6eq1lsupwPUR+cgohunTTfdwPD7cZEJd2p0zmSqtyvcRd+Rpae
 +WIcvTi7P1Ey8W9eCBHQCRtVsuIwp70EIDu8b0sTFvy1ELF5TKrMhG3WZSojc0zMFxzX
 x54Z6g9bakthG8guJwl5gMXlk17VPKWIXt+cBnzITS6vFSkkMqmhoLdoJ5CfEU0dYCJS
 xChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NcXgqI6cxpe0e91iQv5hDRD0JOXrVC93a0bIwF8hPSM=;
 b=rUjOedgasKDTDh3mlzykKfKQxs/gu3qEJxKCP7RLOfOcVFzebJhhk9YOydC1NU31j6
 cITTn3yk1zeS9cHjDqupAuJJqg2ZO7D7latcNNBn12iHUC+hKZiJJ5Fh2w0lbAsiuCFD
 mxPySfv61/d5WyHsh9foVCb5V95OlEkdCPv6F4mWnvvavZUHcTSzzcPPKz0iGb9ghynb
 hOrH9xdCxgqWt2haU9jO8Nl81JtAZkSa7uZvZrUyptBTcjoDQhhb5LEYUc1KYy1BCYYQ
 RcAD3QPqiCS2fqGWs5SxCvxGzxo3CxX4bAGbcrOb4h7MsG0rkKuzNJ0ODCTLk7RuFgRi
 0ZeA==
X-Gm-Message-State: AOAM531/KMht8yN8nIB/F5pM04r43SesyvC8TOOy0z7PV3pBD6zBpcAa
 uPp2GzkCkqw+aXXc+4fZTATV3gzLi+3aM9yO+aOR0Q==
X-Google-Smtp-Source: ABdhPJzFnDz2W0GHUrVIingh+4j+ON9BLU7ywtLTtBYgCoWWu0JGYwbykopD9mXXSuORzJrQ8/OZ1svpmcADUPTh3JU=
X-Received: by 2002:a05:620a:13ea:: with SMTP id
 h10mr476112qkl.30.1640044396450; 
 Mon, 20 Dec 2021 15:53:16 -0800 (PST)
MIME-Version: 1.0
References: <20211217002026.2304973-1-bjorn.andersson@linaro.org>
In-Reply-To: <20211217002026.2304973-1-bjorn.andersson@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Dec 2021 02:53:05 +0300
Message-ID: <CAA8EJpoYJFfB5qfFMoc3-QsmYZzO16C28MOrPyokANQyPBhdyg@mail.gmail.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dp: Only create debugfs for
 PRIMARY minor
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 17 Dec 2021 at 03:19, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> dpu_kms_debugfs_init() is invoked for each minor being registered. Most
> of the files created are unrelated to the minor, so there's no reason to
> present them per minor.
> The exception to this is the DisplayPort code, which ends up invoking
> dp_debug_get() for each minor, each time associate the allocated object
> with dp->debug.
>
> As such dp_debug will create debugfs files in both the PRIMARY and the
> RENDER minor's debugfs directory, but only the last reference will be
> remembered.
>
> The only use of this reference today is in the cleanup path in
> dp_display_deinit_sub_modules() and the dp_debug_private object does
> outlive the debugfs entries in either case, so there doesn't seem to be
> any adverse effects of this, but per the code the current behavior is
> unexpected, so change it to only create debugfs files for the PRIMARY
> minor.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v1:
> - Moved the check up from msm_dp_debugfs_init() to dpu_kms_debugfs_init()
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 2ee70072a1b4..a54f7d373f14 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -193,6 +193,10 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
>         if (!p)
>                 return -EINVAL;
>
> +       /* Only create one set of debugfs per DP instance */

The comment is misleading. Could you please fix it?

> +       if (minor->type != DRM_MINOR_PRIMARY)
> +               return 0;
> +
>         dev = dpu_kms->dev;
>         priv = dev->dev_private;
>
> --
> 2.33.1
>


-- 
With best wishes
Dmitry
