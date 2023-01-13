Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2981766A4E1
	for <lists+freedreno@lfdr.de>; Fri, 13 Jan 2023 22:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419F010E206;
	Fri, 13 Jan 2023 21:12:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080C910E206
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 21:12:40 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-4c131bede4bso302246367b3.5
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 13:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GVPEQvUee51sc8pEGSlqlDJ9IbHcx8EvmRAXbKUQO/Y=;
 b=F2yzNL0KgENVhhP++XHK4RacOn9CcOnd4ePCfWRY6Z6LY9KV62izf9dDDtpF2c0/qk
 f14PiHPyI5199XoUz22fTMI1pJWjS8Z3p6ckLCfyzUZ45Lc49CL+eVbSa/cTikbiR4Xh
 nZ4a8iX4i6U68uDry2jJh0e59Pb1J6VAmd0FAtJtepC68+vCfbVqXJ7xT9tp15j2B+x8
 1UvRA30tI9XkRCCX58Hr93LtIV8A/0+W/y28L5wmoHVlsBGkoIJ416KdefEa6WrTxY7F
 /rPvbs/L6HvyngCOwoysw3X/zUb5sDv86vWtgtTmJwepvv4KIRE9L9C1ho+ifLiDdFIc
 xMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GVPEQvUee51sc8pEGSlqlDJ9IbHcx8EvmRAXbKUQO/Y=;
 b=khi4hF33RKIfvZVFpCvedGaN9O0G4Pj5RXz1IVFpLn8xniBEc1IfVlCKiCjO9T3P5q
 sDGZV9UnoLIROwRkRvwyIDIvBk290FP9qhpoL/Defr+E45NSBUBVkRmK9ymIwjNqp4x7
 VtAuL6eriRwC68cAsn6TJCv9xaed4YPA3gIUA/GpHWNWz60H+Xb91zkUxT7pT8oecyqk
 Oa426gdV064xBFiWhWv5OgwiA4e1bvl3s/EUbqwS0WGU1R+2UClvp/PtwOMMsffAOmwh
 i99+bipWi4CQiTFWOrWrYzAAnthk/Gehs6LeJPOggwPXz73QZ6OsG+5ZSf8mAiKYucMv
 v5vQ==
X-Gm-Message-State: AFqh2koXkwfKGVWzH4CnTJOD/nvkEswrgCrIcuHkjB0x43OUM+Q8zdPp
 ckDJnuOFV+4xoQNEb2W0wcfSgbyIhaSUQkjLvLXcUw==
X-Google-Smtp-Source: AMrXdXv8z967fovvduNbguAX3BsI6mdBhZdHHit2dAOds2+jQ5QPiDPjrY0Z+ZlckJcFfGw7C2QdM19zDRz3HC5fU8Q=
X-Received: by 2002:a81:670b:0:b0:3d6:2151:4038 with SMTP id
 b11-20020a81670b000000b003d621514038mr3340982ywc.418.1673644359176; Fri, 13
 Jan 2023 13:12:39 -0800 (PST)
MIME-Version: 1.0
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
 <20230113083720.39224-2-dmitry.baryshkov@linaro.org>
 <167362343145.2212490.16180994187587985655.robh@kernel.org>
 <20230113211114.GA2925393-robh@kernel.org>
In-Reply-To: <20230113211114.GA2925393-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Jan 2023 23:12:28 +0200
Message-ID: <CAA8EJpq4kfYWYdOhvWbkWAWLPpVpMbvzHhNWsq9x+SWGiTjDLw@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 01/11] dt-bindings: display/msm: convert
 MDP5 schema to YAML format
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 13 Jan 2023 at 23:11, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Jan 13, 2023 at 09:26:52AM -0600, Rob Herring wrote:
> >
> > On Fri, 13 Jan 2023 10:37:10 +0200, Dmitry Baryshkov wrote:
> > > Convert the mdp5.txt into the yaml format. Changes to the existing (txt) schema:
> > >  - MSM8996 has additional "iommu" clock, define it separately
> > >  - Add new properties used on some of platforms:
> > >    - interconnects, interconnect-names
> > >    - iommus
> > >    - power-domains
> > >    - operating-points-v2, opp-table
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  .../devicetree/bindings/display/msm/mdp5.txt  | 132 -----------------
> > >  .../bindings/display/msm/qcom,mdp5.yaml       | 138 ++++++++++++++++++
> > >  2 files changed, 138 insertions(+), 132 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
> > >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> > >
> >
> > Running 'make dtbs_check' with the schema in this patch gives the
> > following warnings. Consider if they are expected or the schema is
> > incorrect. These may not be new warnings.
> >
> > Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> > This will change in the future.
> >
> > Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230113083720.39224-2-dmitry.baryshkov@linaro.org
> >
> >
> > mdp@1a01000: compatible:0: 'qcom,mdp5' was expected
> >       arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb
> >
> > mdp@1a01000: compatible: ['qcom,msm8953-mdp5', 'qcom,mdp5'] is too long
> >       arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb
>
> If your thought is to drop 'qcom,msm8953-mdp5' here that doesn't really
> seem great.

No, quite the opposite. Please see the explanation in the email I sent
a minute ago.

-- 
With best wishes
Dmitry
