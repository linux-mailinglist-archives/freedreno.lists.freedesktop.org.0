Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 190B14C9943
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 00:24:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B923310E7D2;
	Tue,  1 Mar 2022 23:24:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB56210E7D2
 for <freedreno@lists.freedesktop.org>; Tue,  1 Mar 2022 23:24:06 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id w7so227445qvr.3
 for <freedreno@lists.freedesktop.org>; Tue, 01 Mar 2022 15:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OSsBX21NVNiSwRS2p6EfLvoeuH1E+LW1LIdRNsY4vkU=;
 b=Ip5F3z+EsQE2X2jhyvGPCg0qooxL0cLhLEUtWQuSVJHNZhjaSf3bznFF9q1y7urVuO
 ZqXiiVS2BCbCEpQ1PvYzPaP/grTWYp3cJrz2ltZy2W8SYhbAeqCmwTfinzoy0u75vCgR
 qo+psCbS9smznMQRHHGdHfAguKcFpH9uwGbgzrMGM3H/Y6xblVNU51dMvy0I0cmnQlMe
 V6m0y1F+dRZ8g+Gulcg+fuouJy7bsdp78c+wCa1NJULbnhwaIJr41/XSVDDz0VRByegz
 GPuwFYf5q4VbocMB+uX6slZmOa2AB/ceQ+MxV21JKC3Uhg3e8Zer8PTXc9RZAdBl3dIy
 KpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OSsBX21NVNiSwRS2p6EfLvoeuH1E+LW1LIdRNsY4vkU=;
 b=Zleh3zxXxI08zLhQy/6ipA5uofZYALpcK8IuPZCt0nD2K2XglOPTmEWmWn3oT61uYg
 +GgkmgAtWpfGhMTMrKcPXpW7L5YBb44lqvV20spwHLvYItfwDnILNPdfcsQi7OmSatA2
 noCBsdrs0QLs/o5WWUj8DWO0zDzam2RtuItENJOrZBVMW3w77EowvMCq9jfx8GJt7Lyi
 Jd3jE0Xp/UQeQS3lD8yeyU5NXFhAUU5DtA2YVWgMt6UqCQk+/hyqQy0L6V9oJaiXJMI7
 H4BJLu8vc1fAXOkYFfQJtD76RssA0ugstrAOLrVNSoxD/7Wtv1gz+aL2zOueAsTn5usH
 fHeg==
X-Gm-Message-State: AOAM533Y03QHD0qzvsOIGU/PPenHmzC3g6k1lxd3v9Zp2akbPhTe7tQE
 QIb66UD0YE/pq5SfLGJRbzLJHAQZjFa+XqEPkjvHCQ==
X-Google-Smtp-Source: ABdhPJxo6UiX3Xn1XQ6J/2PJeWZvf7DQmneQL+F9WZaIYeAoXL24XAGZpq5ExpvtMoKAaF7w482xqTsYXr7VK3rTP1A=
X-Received: by 2002:ad4:53a4:0:b0:430:1d8c:18ea with SMTP id
 j4-20020ad453a4000000b004301d8c18eamr18944909qvv.115.1646177045898; Tue, 01
 Mar 2022 15:24:05 -0800 (PST)
MIME-Version: 1.0
References: <1644852547-10067-1-git-send-email-loic.poulain@linaro.org>
 <1644852547-10067-2-git-send-email-loic.poulain@linaro.org>
 <CAL_JsqKg06h818-kMDrtROzHn8zPcjwgzWAE_q=egXPJHmg=-w@mail.gmail.com>
In-Reply-To: <CAL_JsqKg06h818-kMDrtROzHn8zPcjwgzWAE_q=egXPJHmg=-w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 2 Mar 2022 02:23:54 +0300
Message-ID: <CAA8EJprnALcK8HObkNqkgW6t4gpLHf9LuS1-mEHJJqt6va=zxQ@mail.gmail.com>
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

On Tue, 1 Mar 2022 at 20:35, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Feb 14, 2022 at 9:29 AM Loic Poulain <loic.poulain@linaro.org> wrote:
> >
> > QCM2290 MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> > like DPU display controller, DSI etc. Add YAML schema for DPU device
> > tree bindings
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  v2: no change
> >  v3: no change (resent with reviewed-by + freedreno list)
> >
> >  .../bindings/display/msm/dpu-qcm2290.yaml          | 214 +++++++++++++++++++++
> >  1 file changed, 214 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
>
> This is now failing in linux-next. Please fix or revert:

I can not reproduce it here, with the linux-next from 20220301 and
dtschema 2022.1

>
> Error: Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dts:81.3-82.1
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:386:
> Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dt.yaml]
> Error 1
>
> Rob



-- 
With best wishes
Dmitry
