Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9912A4C91A1
	for <lists+freedreno@lfdr.de>; Tue,  1 Mar 2022 18:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3908B10E669;
	Tue,  1 Mar 2022 17:35:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8876E10E669
 for <freedreno@lists.freedesktop.org>; Tue,  1 Mar 2022 17:35:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2FE6CB8184F
 for <freedreno@lists.freedesktop.org>; Tue,  1 Mar 2022 17:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4849C340F2
 for <freedreno@lists.freedesktop.org>; Tue,  1 Mar 2022 17:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646156137;
 bh=PEiejDSUY1k4MnU/4nOtk9UWonjtqT6nqjDBDSe2n5I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=p6QPTB1v+6ZwauZfmHyIJCwmYZEqj2Fidy4BmgQEh6J1gGUSlSPsVovYasy2RYLwQ
 kvEwemgoM4fWt4jTM/cfueD++vhS2s7N5fHOBPUP7iFZlXCb+tfhUILmHG/KOMlGzW
 PMI1UGdtrNliatVqv/0It8yGUxOCyrjLu7GeGWEgEXfcolHIB8JVK8LjcARo5QTbhf
 awzH1WG5fIWCnMKv8r1INFkfGecyc7t55Rvhcdt1OOS/jsNwiJB6Yaoy1tORm55ftn
 6m8WUn0XKnhXYl3YH/tng5sdWfJZ+RDYC6P38L3bhxS3U0KDRCBCiMP4NABCOPyeJW
 kWw05SmBNjwnA==
Received: by mail-ed1-f46.google.com with SMTP id h15so22998012edv.7
 for <freedreno@lists.freedesktop.org>; Tue, 01 Mar 2022 09:35:37 -0800 (PST)
X-Gm-Message-State: AOAM531GPsWY+CL39D1K2LUVqCEKShKqe4qZyJjZ2WbeTSSWbyucc/vu
 IvyDU4XOuckbsGxPerXBqDzLJkaFJsHKFc96bQ==
X-Google-Smtp-Source: ABdhPJwhTYbzmnAgzwsjhoCIYrCWTDzQdNRDTWtDhUMgy4u2nP1CxHhhVU7hF4VFU3HyG9xqHf9dn54nSnSViLNBIYU=
X-Received: by 2002:aa7:d415:0:b0:410:a0fa:dc40 with SMTP id
 z21-20020aa7d415000000b00410a0fadc40mr25204137edq.46.1646156136108; Tue, 01
 Mar 2022 09:35:36 -0800 (PST)
MIME-Version: 1.0
References: <1644852547-10067-1-git-send-email-loic.poulain@linaro.org>
 <1644852547-10067-2-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1644852547-10067-2-git-send-email-loic.poulain@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 1 Mar 2022 11:35:24 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKg06h818-kMDrtROzHn8zPcjwgzWAE_q=egXPJHmg=-w@mail.gmail.com>
Message-ID: <CAL_JsqKg06h818-kMDrtROzHn8zPcjwgzWAE_q=egXPJHmg=-w@mail.gmail.com>
To: Loic Poulain <loic.poulain@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 2/2] dt-bindings: msm: disp: add yaml
 schemas for QCM2290 DPU bindings
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
Cc: devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Feb 14, 2022 at 9:29 AM Loic Poulain <loic.poulain@linaro.org> wrote:
>
> QCM2290 MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema for DPU device
> tree bindings
>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  v2: no change
>  v3: no change (resent with reviewed-by + freedreno list)
>
>  .../bindings/display/msm/dpu-qcm2290.yaml          | 214 +++++++++++++++++++++
>  1 file changed, 214 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml

This is now failing in linux-next. Please fix or revert:

Error: Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dts:81.3-82.1
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:386:
Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dt.yaml]
Error 1

Rob
