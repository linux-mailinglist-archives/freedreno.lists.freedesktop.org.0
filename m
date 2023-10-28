Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4342F7DA473
	for <lists+freedreno@lfdr.de>; Sat, 28 Oct 2023 02:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A52310EA89;
	Sat, 28 Oct 2023 00:38:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D8210EA8B
 for <freedreno@lists.freedesktop.org>; Sat, 28 Oct 2023 00:38:53 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5a7b3d33663so22014667b3.3
 for <freedreno@lists.freedesktop.org>; Fri, 27 Oct 2023 17:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698453532; x=1699058332; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m32H4Hzs8ykpGLbDPvDucWAg27HjQt3n+XmRLfHVk8o=;
 b=uyCfQr6qB220LV1KYMnj2KeYcJTLSgYtCEpL8jpoQnghFcgp5OXwIhLsVlDDErmwDR
 vJqDNNbYlpToMQmhbPcHJUQPCHT1SqpkiaXic/Wnwgj/IK2nb6wKP93zmzCxhlPqvchC
 S6AE/lHsFH0Mtq/xctpAnB8rfeajqPXWqTGWsiF/CIR4dwPyFJoeVk75saT29ftSjkKW
 gS6YiPzbn3XJzQ29wlg443o4CWPEm6MKezke0bgUPOfLkofKWZUnyaux91rpizLFKQHh
 em35ekIqtpEJTmO2hhwkqPnXjBK9tiPqmdnd7DyV/BR4QKm6u5V/UNl5xNr90pBupp9H
 h1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698453532; x=1699058332;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m32H4Hzs8ykpGLbDPvDucWAg27HjQt3n+XmRLfHVk8o=;
 b=h6jvRrPfab6wOEU+J+cZkYldV7kZOileKICFNKBaovxACaiadimsrD5955GVbiBAHm
 XVmP+VMIDU7lhCMERNuwVtKEljUYpe0+HSADp5E2XsOhcAiNhaAQNzmZHoiPFzEHdQ+2
 uY97ZouVYS+7qdWuAEx//+tAlBqZgIxXa9dq42OBaxMz3NCLT31dU9qr4xKsXMlqx4sb
 JXEgRDI2njT+Gxase9FR9TxnyoOJxu55aJmHJee/QDueEvypzEQQYp+T4yxnDqHfffGk
 s3ELqPnKr94c0CB1CFN5oNvzdFOzqwBWN3U5FMxJVVlrmOLhyYVooKz5nCO47OfVUJPB
 1FbA==
X-Gm-Message-State: AOJu0YxsdX34FZ6gxuI6YyP1uXn/94pai4OCWdvNtm4mI+mG7u20R2uo
 q+pwKAPsTWiKjnrlbff6HwRSfFGkmJ/7YDdmYxwRIw==
X-Google-Smtp-Source: AGHT+IEDsS4pdoUE1Qwg7Seoangbh4UhCSVIOzVOPb2hip5s80EP6sbN1q2SQn/BfjFTB3Wv+pMshe07+l2I0j15KMo=
X-Received: by 2002:a81:b60b:0:b0:5a7:ab55:b9af with SMTP id
 u11-20020a81b60b000000b005a7ab55b9afmr4486377ywh.35.1698453532139; Fri, 27
 Oct 2023 17:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231027165859.395638-1-robdclark@gmail.com>
 <20231027165859.395638-3-robdclark@gmail.com>
In-Reply-To: <20231027165859.395638-3-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 28 Oct 2023 03:38:41 +0300
Message-ID: <CAA8EJprsWTX+aG+wARffRWx_6UOEuHWRnBYnsLyrA2o=h3tQJA@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 2/7] drm/msm/gem: Remove
 submit_unlock_unpin_bo()
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
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 27 Oct 2023 at 19:59, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The only point it is called is before pinning objects, so the "unpin"
> part of the name is fiction.  Just remove call submit_cleanup_bo()

Nit: 'remove it and call'

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> directly.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)


-- 
With best wishes
Dmitry
