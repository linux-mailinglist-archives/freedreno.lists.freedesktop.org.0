Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EA158CACD
	for <lists+freedreno@lfdr.de>; Mon,  8 Aug 2022 16:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5284591339;
	Mon,  8 Aug 2022 14:53:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D249756D
 for <freedreno@lists.freedesktop.org>; Mon,  8 Aug 2022 14:49:18 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id f22so11607637edc.7
 for <freedreno@lists.freedesktop.org>; Mon, 08 Aug 2022 07:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=sGGMDrvq70fK3xNBUxx3zSxTGxbNUsun6AK0mtlXrck=;
 b=aNeNHYUnGAERLnnsoWYIWNZLsBb+XskAb+Zbzep5u56gCqHprwCZpAhjmoxi0eGCt3
 ENCGw+eikSwJrImaEpmJpnt4dXgTf5WdEsQDkixIVfLWK3xndLG9hJyfN5tlBSXsjS8b
 iSl4IzQlwipS4OiUW+qYCtv4IWP6ti/mpxM7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=sGGMDrvq70fK3xNBUxx3zSxTGxbNUsun6AK0mtlXrck=;
 b=I60zw0ILvc5lmAe7PWzlwmEsNHzUfq9cB/G9NfXKKwyO1e9GqDCRb37vpi7E7XDgLN
 c730/pkIqQd4CS+r20Pv1UnsCdQr/008aY0edD2zVHHtTKDOsHw+mo1OEYJ0TzuDMKlH
 eOm1sPrYIZHZVq325NgIZp+MpcDCBEPwegfv8LtXshJm94mKQK62VSVMSKCwLOnOPrv2
 FQAfF7IJzyzKSrshV89msweKfbKxCWcJ4tClUXqyy/AuyzBju8azWn/Q9SlI4WNSxLaX
 ryvfDT2zVqwoppMW+royrvp2KjoNRWPuAU0hZmARaq6R9CjV8FsD572RRmHog7xbkUE9
 qljw==
X-Gm-Message-State: ACgBeo2nptEgFpq3qdrdK1By2HynnUmAFLPqY/bzZgngGGrtaHm30sJF
 /zg7iLCeJB/N1DcrIsMvbTDblBlL0Vmu/r7n
X-Google-Smtp-Source: AA6agR56AFs8defRKSGQesVEaZS4ogsc6Gx7v3ckFywBilwCc8Mz78Mg3fsTXKOW+6WXEfyeCWa30g==
X-Received: by 2002:a05:6402:524a:b0:43d:aa71:33d8 with SMTP id
 t10-20020a056402524a00b0043daa7133d8mr18656884edd.33.1659970156824; 
 Mon, 08 Aug 2022 07:49:16 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44]) by smtp.gmail.com with ESMTPSA id
 ky6-20020a170907778600b007307d099ed7sm5060250ejc.121.2022.08.08.07.49.13
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 07:49:15 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id v3so11245432wrp.0
 for <freedreno@lists.freedesktop.org>; Mon, 08 Aug 2022 07:49:13 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr11636287wrr.583.1659970153270; Mon, 08
 Aug 2022 07:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <1659608930-4370-1-git-send-email-quic_kalyant@quicinc.com>
 <CAA8EJpoAN4CVMKNouh3pPtX-5rnBeL3_T60M5cNhirNEmNeEkQ@mail.gmail.com>
 <BN0PR02MB8142FFB573A4D05B0560A13996639@BN0PR02MB8142.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB8142FFB573A4D05B0560A13996639@BN0PR02MB8142.namprd02.prod.outlook.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 Aug 2022 07:49:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4cddyPxg2D5KP9ew2i=AQOSn=Jz_OmuZ0BrZCu2+MLA@mail.gmail.com>
Message-ID: <CAD=FV=U4cddyPxg2D5KP9ew2i=AQOSn=Jz_OmuZ0BrZCu2+MLA@mail.gmail.com>
To: Kalyan Thota <kalyant@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [v1] drm/msm/disp/dpu1: add support for
 hierarchical flush for dspp in sc7280
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Vinod Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Aug 8, 2022 at 3:44 AM Kalyan Thota <kalyant@qti.qualcomm.com> wrote:
>
> >I'd like to land at least patches 6-8 from [1] next cycle. They clean up the CTL
> >interface. Could you please rebase your patch on top of them?
> >
>
> Sure I'll wait for the series to rebase. @Doug can you comment if this is okay and this patch is not needed immediately ?
>
> >[1] https://patchwork.freedesktop.org/series/99909/

I don't personally see a problem basing them atop a cleanup. If the
patches Dmitry points at are targeted for the next cycle then that
seems like a pretty reasonable timeframe to me.

-Doug
