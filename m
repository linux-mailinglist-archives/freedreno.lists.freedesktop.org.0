Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3974C5E8F47
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 20:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AE110E07A;
	Sat, 24 Sep 2022 18:22:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CA110E081
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 18:22:33 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3321c2a8d4cso30535837b3.5
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 11:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=s2yVFEWeDENib5ZI/a0e4ge6cSf4cj8rWCXGLC8hWc8=;
 b=wxMdeFEZDUmk1q3u139fGzFutmWA3RDqZJDDpILqRY8aNRDEHhddkYzPg3AmSAmtKL
 a28v+VdYgGVulYsS+pbwPNXyWq4u7zF0P3w/4Jo2MLt0Q99QblBroXAzGYWb+cTHxXqg
 OCpHbKEzut3wEex19I/RXeUN9ZV4FqD2L33md0qJ+APWgl/qlX0dJrH9stA6F+f4ZG8t
 /5+CWuEAjpFC6q/1pn3czSH1jVuj6S4lkcMCbKnPj2PSP6gzRmPt3Fg3zyYRGmbYSx69
 xltQVHNl+GV6On0h971Iu3BqUG1ZUJh4KloHkfvQgYzjDYusKvsoJKVKUqUxizCKmIJg
 Mchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=s2yVFEWeDENib5ZI/a0e4ge6cSf4cj8rWCXGLC8hWc8=;
 b=BCxD8yqDvjE82b9JXBQMxGVhWOKBRVfgjNPwE9tMAns4NezTz9ovt3+8ZjhHd1ho9d
 fl4J0RiPLM0FCuMjR7zLaGa24J+hDDE1T8/TYZ3m13wGdAGHQf34910f4zt3PclmIPhw
 Q5KWZYMuUrkwhFwWVG1O9FqZX1H4FnSGn58MSMoonyDOV7LgBAh1k6R8goMTzQL65Ou+
 QXb5dD/7KboQj82Klj3P7af65lSVEA3KZR7Lker+t8pHAWZif2Md38XoVM4kVsEnBDrj
 YWPmN/Wzvx7JhiCVbwHGjiFVKUi1TVtSS9koq7LhPGuJ6rAAIXQz89sFAsFY8PYD9XRg
 kYNg==
X-Gm-Message-State: ACrzQf2blddYlMvuxGMPxcfQd+DFjcxebCqSghMB3+jFoi8m9CKYgpHP
 dBhswJRzw2qoZG7T8KBVvjSBMy6IJwheA6G7FcZv0g==
X-Google-Smtp-Source: AMsMyM55C7BiVAgLyyl2DjyMdVD0pDcGpUVDvvuje9A16f1dgXZcSU4O2RBMsUKcA7MgADqVBthdJWgunYiS+vBYqbo=
X-Received: by 2002:a81:1e0d:0:b0:33b:fb67:9895 with SMTP id
 e13-20020a811e0d000000b0033bfb679895mr13952159ywe.188.1664043752195; Sat, 24
 Sep 2022 11:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-4-dmitry.baryshkov@linaro.org>
 <20220924172324.qdgz5dnccncadmfz@krzk-bin>
In-Reply-To: <20220924172324.qdgz5dnccncadmfz@krzk-bin>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 24 Sep 2022 21:22:21 +0300
Message-ID: <CAA8EJpoZq9zrVeSYdn4_MQ_HVQTEXR8Zmx+BWpoo1PDUS7X+5A@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v8 03/12] dt-bindings: display/msm: add
 interconnects property to qcom, mdss-smd845
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 24 Sept 2022 at 20:23, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On Sat, 24 Sep 2022 15:36:02 +0300, Dmitry Baryshkov wrote:
> > Add interconnects required for the SDM845 MDSS device tree node. This
> > change was made in the commit c8c61c09e38b ("arm64: dts: qcom: sdm845:
> > Add interconnects property for display"), but was not reflected in the
> > schema.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/display/msm/dpu-sdm845.yaml    | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
>
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
>
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
>
> Full log is available here: https://patchwork.ozlabs.org/patch/1681884
>
>
> mdss@ae00000: 'dsi-phy@ae94400', 'dsi-phy@ae96400', 'dsi@ae94000', 'dsi@ae96000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
>         arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
>         arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
>         arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
>         arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
>         arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
>         arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
>         arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
>         arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
>         arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
>         arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
>         arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
>         arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
>         arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
>         arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
>         arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
>         arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
>         arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

This is expected and fixed by one of the later patches.

-- 
With best wishes
Dmitry
