Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DCC4DD1B6
	for <lists+freedreno@lfdr.de>; Fri, 18 Mar 2022 01:12:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DDF10E13A;
	Fri, 18 Mar 2022 00:12:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF21C10E13A
 for <freedreno@lists.freedesktop.org>; Fri, 18 Mar 2022 00:12:14 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id bi12so14038622ejb.3
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 17:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GlfqT3gCisJBMTAg9owO2Ux8q0knKebgrHQt0YZbpxI=;
 b=nBDhznL6GSZim3PdexrPGQqpwQ4fFBAapWTmPPNrAt0uN427dmLC1mJrI8HXE1C1kx
 upaggKMpoTVkewUUN8f4G2ccK2tUnREtzjnOO9fkjvE2aXhO73VuvMgL2JxHG1mUNou7
 E4BgOMO9zLLV6AZpoxwm0FAG5//90kHjahP1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GlfqT3gCisJBMTAg9owO2Ux8q0knKebgrHQt0YZbpxI=;
 b=12GdlKeIbe3I7QXLAZ1RzJ9AUYu3gQfgAfQb9X2G6u+BqrNhVBD0zvTplPDdDbF39V
 8nCK8af/ZZgokVqHm4Ees2V5cWl/z6LjCFXGu++IMM2/yCRdxO6mZ56eiLNNvpSbDX4Z
 fcy0KhWaMcgBpk2YrwbHkFtZsySWkYnTxmnfL2Txnq3pajfZbl0/OoejVL5w/8GJg/hs
 sZATT8FKN1ESlYw2ZXqSstcpkomqQYpIG9mcpbGnOFrNjtxlfhA2VjrGm6zXKpijivKg
 XFX6LymfNU3WQQkeiNEBkib/Dopvy5hJ0roCB5qToW3d24NMjVX4SurPI77hN1zK2kgT
 ckTw==
X-Gm-Message-State: AOAM531vbfHyzcg8LrW7f9Nk3WKV+kxCXM4FqAPrGaicln/aJE+tSQcP
 tWarF4oNUW5fjhjK3IAsPlQofy8CHiEPu2IDP/8=
X-Google-Smtp-Source: ABdhPJz2mv+BeMXUQV2NmKGMJXl0AMvA62atbI2Wub0KxyQ1T7gk1mAjGKSGDOtj6+Zxt4BGQKljRg==
X-Received: by 2002:a17:906:3ec7:b0:6d6:e52b:b with SMTP id
 d7-20020a1709063ec700b006d6e52b000bmr6639524ejj.521.1647562332979; 
 Thu, 17 Mar 2022 17:12:12 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44]) by smtp.gmail.com with ESMTPSA id
 m21-20020a17090677d500b006df766974basm3003060ejn.3.2022.03.17.17.12.12
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 17:12:12 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id d7so9635916wrb.7
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 17:12:12 -0700 (PDT)
X-Received: by 2002:adf:fc47:0:b0:203:dda1:4311 with SMTP id
 e7-20020adffc47000000b00203dda14311mr6191933wrs.301.1647562331786; Thu, 17
 Mar 2022 17:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com>
 <1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Mar 2022 17:11:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V4SWtyz4fFEmvKD_N-2ioS4R65UDZRU7utQm=0CSzp=g@mail.gmail.com>
Message-ID: <CAD=FV=V4SWtyz4fFEmvKD_N-2ioS4R65UDZRU7utQm=0CSzp=g@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 1/5] drm/msm/disp/dpu1: set mdp clk to
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
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 14, 2022 at 7:47 AM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> use max clock during probe/bind sequence from the opp table.
> The clock will be scaled down when framework sends an update.
>
> Fixes: 25fdd5933("drm/msm: Add SDM845 DPU support")

The "Fixes:" format is a little wrong. Should have more digits and a
space before the parenthesis. AKA:

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")

> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

This looks good to me now other than the bad Fixes tag. I presume
you'll want to spin with the extra verbosity in the CL description
that Stephen asked for, though.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
