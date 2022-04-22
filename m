Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B3450BB82
	for <lists+freedreno@lfdr.de>; Fri, 22 Apr 2022 17:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DE910E4BC;
	Fri, 22 Apr 2022 15:17:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C5010E4BC
 for <freedreno@lists.freedesktop.org>; Fri, 22 Apr 2022 15:17:10 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id l7so17064848ejn.2
 for <freedreno@lists.freedesktop.org>; Fri, 22 Apr 2022 08:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bCYg7vAuheGkarssmttLzV2pY8DshumVmOA1bng63AI=;
 b=MEHquvyCw0wwPt7kCehis+PVhTx3pdKhV9pM8R14d3I84H9iWWWE6KzzCxSsYQhhsl
 c83Cbt0ZGqEK5noq0q1nj6TCqfNagjRO4ZvehG7CajbMG52gB3gjedYjBEbc1tmEBrbI
 A/ZhHFcuM+kMPol4W5p8CvCk05gkvpyT0o8xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bCYg7vAuheGkarssmttLzV2pY8DshumVmOA1bng63AI=;
 b=lc23LedMvxc9qL1RbKqR/dyxensWiI858LenGkTDWY6gEuD3oiWZzJtQ8ORpcFodeC
 Ca65qWOvkThz4xkFTRjXM0w3hdZ7OVWZ5ln02k0zoOUpNl5YcxqZBqjGaUEVNrWVDzdo
 4XQyj5P7NEeVclirB//iBQYo2wpD6Evl+zuU3gXmj9zRdNn5nbgt6YANQ4pitPsMgykm
 0NDunMVADd+lepQEBLkTnRfG0L+D+AYCMaUJiPiUW42oFnqiqKaoM3YDZbNdWaksoAwa
 XZFFeSWk9WNFpVkdThZEkT4VDgM21v776zauMaPS8SpvsNanm1BwSg4Rwda4nqgyW8YV
 5hOw==
X-Gm-Message-State: AOAM533VxaAZxjpC3JnZAOkMCjGeQdHJwHNwB9e24HhH3Ozq4qVxuHa2
 f8yUkfO8C9R/+kdpAaFy8GMV2X8dkmVRLObRz3I=
X-Google-Smtp-Source: ABdhPJyJWHVWJWgueuKLJQ1WGq0MqRVH2xxV90xnoGtzDVmyAI/xSm6HM7kgZBxO/96BqnA/hmnSdg==
X-Received: by 2002:a17:907:72d0:b0:6db:4788:66a9 with SMTP id
 du16-20020a17090772d000b006db478866a9mr4774493ejc.516.1650640628177; 
 Fri, 22 Apr 2022 08:17:08 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 n15-20020a1709062bcf00b006ee82143cfbsm840979ejg.51.2022.04.22.08.17.06
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 08:17:06 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id q20so5293030wmq.1
 for <freedreno@lists.freedesktop.org>; Fri, 22 Apr 2022 08:17:06 -0700 (PDT)
X-Received: by 2002:a05:600c:3c99:b0:392:b49c:7b79 with SMTP id
 bg25-20020a05600c3c9900b00392b49c7b79mr4569863wmb.199.1650640625481; Fri, 22
 Apr 2022 08:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <1647919631-14447-1-git-send-email-quic_vpolimer@quicinc.com>
 <1647919631-14447-2-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1647919631-14447-2-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 22 Apr 2022 08:16:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xe1bOuiG0T7Y3rRN0cmsjdUK-sDvE-E02eDfSdKih9MA@mail.gmail.com>
Message-ID: <CAD=FV=Xe1bOuiG0T7Y3rRN0cmsjdUK-sDvE-E02eDfSdKih9MA@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v7 1/5] drm/msm/disp/dpu1: set mdp clk to
 the maximum frequency in opp table during probe
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 21, 2022 at 8:27 PM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> Set mdp clock to max clock rate during probe/bind sequence from the
> opp table so that rails are not at undetermined state. Since we do not
> know what will be the rate set in boot loader, it would be ideal to
> vote at max frequency. There could be a firmware display programmed
> in bootloader and we want to transition it to kernel without underflowing.
> The clock will be scaled down later when framework sends an update.
>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Just wanted to confirm that this patch will be queued up somewhat
soon. I think it's good to go but I don't see it in any trees yet. ;-)

FWIW, I can also say that I've tested this patch and it fixes the
underrun issues on sc7280-herobrine-rev1.

Tested-by: Douglas Anderson <dianders@chromium.org>

-Doug
