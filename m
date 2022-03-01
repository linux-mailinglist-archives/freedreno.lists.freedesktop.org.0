Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5036E4C9950
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 00:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE3F10E305;
	Tue,  1 Mar 2022 23:28:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F9110E305
 for <freedreno@lists.freedesktop.org>; Tue,  1 Mar 2022 23:28:43 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id f11so229446qvz.4
 for <freedreno@lists.freedesktop.org>; Tue, 01 Mar 2022 15:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VNaBUvhJPCTRWF5/zJjQeON1Z5NfOzXWX9Lpo+um65Q=;
 b=LfjujM0z8Yytm86m8JS2eeYHuGlmQCrZt3M4KVtYFSZv93ns94MC9V21Rdia3A/p/R
 ytGFw79bo8/031XW4fQJXahvaCL9+v+pxaf+ZUjuvCCOCaKbBem2Q29l9erMuavHkKZW
 uYNY99JbxSIUs32W8WqQQtc+K7rhcj9p64YtV1N3uyRptK7MD3F0PCd1qBh7ffL23eDC
 UDcHTn+BIgQyryI5Nat3px/l/we1BoxX4CjfmUVg5dzWeHQaaZN9Zwoc9KmEL1Kukc18
 vActe1Co0+48OzMiY/u35N+bN9A45qMW0r+5p/Lsrp/8nEoAV2aUhGzoSC3GVJh3GU0q
 +2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VNaBUvhJPCTRWF5/zJjQeON1Z5NfOzXWX9Lpo+um65Q=;
 b=8BkIIORUQxl0GrFENmjLBgjdBzB/TYw+FzgQjrYM4SXVyKFAmWoGOm9qsfeyr/yJiL
 Mg2vRiIbLcZyyy72XfdVDlGNOT/7u5s7Ex1MPmtsgwZMhBLtKKcYJrVebjja8YVbrz1q
 0f6fmq4wyt5m4M9C311qTeUQnWjR8TJWL1R3CixiT0UBU6ZlNzOMP5EyYShB2UugCP5s
 o9ViG3VwgmylkcuXzhvcPlqGcJY+uqsmZy/m4bg04dlkVW1XSO+yB/eODEQ+Cc5HX0eR
 0O5XXj8pHaOLTndIpkaLnrMB773jtHMxqxQOMjDnLp9cZ0oNhi7DK8o+4EKLHZLkVyym
 yibw==
X-Gm-Message-State: AOAM533lLbR722zIuU6/CPx77q67mkqxPQt0EGOGP9BqAK58bTY0NElq
 ilaFfk+kwr60VSyDSDgAeOyJvgMur5HCMhbAep99eA==
X-Google-Smtp-Source: ABdhPJwz8rUgUrs1yf6BQ4V64Nw+vGZS/tZlDmQMYQT70EZlT/W6mkHrTPZGt4ZxEgfq/D8A1hU1lbIk5X+ku4E2f6Q=
X-Received: by 2002:a0c:e841:0:b0:435:188c:16f6 with SMTP id
 l1-20020a0ce841000000b00435188c16f6mr2172506qvo.73.1646177322668; Tue, 01 Mar
 2022 15:28:42 -0800 (PST)
MIME-Version: 1.0
References: <1644852547-10067-1-git-send-email-loic.poulain@linaro.org>
 <1644852547-10067-2-git-send-email-loic.poulain@linaro.org>
 <CAL_JsqKg06h818-kMDrtROzHn8zPcjwgzWAE_q=egXPJHmg=-w@mail.gmail.com>
 <CAA8EJprnALcK8HObkNqkgW6t4gpLHf9LuS1-mEHJJqt6va=zxQ@mail.gmail.com>
In-Reply-To: <CAA8EJprnALcK8HObkNqkgW6t4gpLHf9LuS1-mEHJJqt6va=zxQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 2 Mar 2022 02:28:31 +0300
Message-ID: <CAA8EJppAFpVN2OP7yc8y+NXvJ3uMqiTBXRUg1Z7zgCWksyzfbg@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 2 Mar 2022 at 02:23, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 1 Mar 2022 at 20:35, Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, Feb 14, 2022 at 9:29 AM Loic Poulain <loic.poulain@linaro.org> wrote:
> > >
> > > QCM2290 MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> > > like DPU display controller, DSI etc. Add YAML schema for DPU device
> > > tree bindings
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > > ---
> > >  v2: no change
> > >  v3: no change (resent with reviewed-by + freedreno list)
> > >
> > >  .../bindings/display/msm/dpu-qcm2290.yaml          | 214 +++++++++++++++++++++
> > >  1 file changed, 214 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> >
> > This is now failing in linux-next. Please fix or revert:
>
> I can not reproduce it here, with the linux-next from 20220301 and
> dtschema 2022.1

Ugh. Excuse me. Reproduced the issue.

>
> >
> > Error: Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dts:81.3-82.1
> > syntax error
> > FATAL ERROR: Unable to parse input tree
> > make[1]: *** [scripts/Makefile.lib:386:
> > Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dt.yaml]
> > Error 1
> >
> > Rob
>
>
>
> --
> With best wishes
> Dmitry



-- 
With best wishes
Dmitry
