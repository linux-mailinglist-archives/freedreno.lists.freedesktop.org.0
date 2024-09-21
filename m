Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EB397DE63
	for <lists+freedreno@lfdr.de>; Sat, 21 Sep 2024 20:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D1E10E04E;
	Sat, 21 Sep 2024 18:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p0T1+j0w";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E7510E08A
 for <freedreno@lists.freedesktop.org>; Sat, 21 Sep 2024 18:52:34 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6ddccc408e1so23425807b3.3
 for <freedreno@lists.freedesktop.org>; Sat, 21 Sep 2024 11:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726944753; x=1727549553; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9YOWHzzVwKmpVXuH6tT4H74KWT1SKFzuJzeXObWQIF0=;
 b=p0T1+j0wSCDG5olnlegYC8sMsVWbFykXN+l00T++Frg4GZCoGfxL+7UuBv1cVCy7BK
 eJK1o6pLw/Ls5AhoZddXNmhBc8KjnkywkTJh3dMxaE0xqLPfPYb539O4HrcDJsQCI0Dz
 b3n/gzoLh72FFdAdMtbNNqdxG6GoKg6bq4JRS4uWtuvZWaHJOnLFTEbh9C+JiIaRhFEx
 xe8G3DbQtPKz4b5JTdCBLABhIlM4UGGHsdrOBSDKUU8Wp5GkZBcRhaQT7xYIrHDV7sPB
 VjcTfsMZfcR5KtnCD70dmpyoFdWIcXtyaWoJy8OhaKdgYV9kTVheLzmyf01sPlkBahNa
 ZEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726944753; x=1727549553;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9YOWHzzVwKmpVXuH6tT4H74KWT1SKFzuJzeXObWQIF0=;
 b=sEmLXbXkhr0/oCd2R2+JQWJ4DtR2St3iG9RlR+43AXfS/uPjzttQTKxwoqj9fCMQpC
 azvuZhzmUoH/JWCAmb1Fccw11nBoXzCIi5+hdv0ywZ1zvkUc1DL8TkFlrZfTWOdue+lT
 VJbHWc8UpiiSHNFTMjiMrtTJwbdoqEg4RTq7z9A3KAYT76IfHDPEo0rbr7vbh3zNlsJ7
 eGPzg2KiOrFU8SbYFh52fHrTquGZddSsz/qshqXinHpfAoQWg/Oj9o9sYAhidxK48G1O
 hiwshKe8+2OvE3dIx1ozPprStOA5c9sGuzlf/2jM/GkVXQNO58NN5BCyaUuAgDk64XJE
 AmOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0DZxoAtbOtwyLIKCwvCdbCj1WgTbM1uY3TGZBQyWXug7KKrlVFsl0pzgzcsA5w7GgY7YNg8m0T0w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxe/18krcqzFT4kqvbsTCoZTlvPdlOFvamzFyaABp9Y8WePQ8xU
 tbxf5WfigBvmiVOp38hODqGnDBoPeu65BWiEYAZHZW+Ws0OaCAtRCNnbGdaVU6yIBpFhQMqL3a9
 wNyRCwtGRu7wnCHygwi5nvr+rvHyZUGgR9FIqBQ==
X-Google-Smtp-Source: AGHT+IG5tWL7XQk5lTl4IxHn8rt6ybrJDIlTwRt+uw8pRlg2OHh+fLMthOUKic2sFVqZrPqkaKCtAgCb23pQ48rnvJM=
X-Received: by 2002:a05:690c:48c4:b0:6db:a7d3:6410 with SMTP id
 00721157ae682-6dfeefe5f02mr62623227b3.44.1726944753473; Sat, 21 Sep 2024
 11:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <20240912071437.1708969-2-quic_mahap@quicinc.com>
 <78d9c6f9-5667-4ecf-92c9-73e9e4b9b424@kernel.org>
In-Reply-To: <78d9c6f9-5667-4ecf-92c9-73e9e4b9b424@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 21 Sep 2024 20:52:22 +0200
Message-ID: <CAA8EJppc7jUfVx7Fw=tBjWGdp7ULb2pbK9x-re+1bNq2kxMR4A@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: Document MDSS on SA8775P
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mahadevan <quic_mahap@quicinc.com>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, 
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com, 
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 swboyd@chromium.org, konrad.dybcio@linaro.org, danila@jiaxyga.com, 
 bigfoot@classfun.cn, neil.armstrong@linaro.org, mailingradian@gmail.com, 
 quic_jesszhan@quicinc.com, andersson@kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, quic_kalyant@quicinc.com, 
 quic_jmadiset@quicinc.com, quic_vpolimer@quicinc.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 21 Sept 2024 at 20:23, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 12/09/2024 09:14, Mahadevan wrote:
> >
> > +        clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> > +                 <&gcc GCC_DISP_HF_AXI_CLK>,
> > +                 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
> > +
> > +        interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> > +        interrupt-controller;
> > +        #interrupt-cells = <1>;
> > +
> > +        iommus = <&apps_smmu 0x1000 0x402>;
> > +
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +        ranges;
> > +
> > +        status = "disabled";
>
> Uh no, it cannot be disabled. What would be the point of it? Please
> reach to your colleagues for some internal review before posting (see
> also go/upstream in internal systems).

Rob, can we make it part of dt-validate maybe? Error out if schema
_examples_ have disabled nodes.

-- 
With best wishes
Dmitry
