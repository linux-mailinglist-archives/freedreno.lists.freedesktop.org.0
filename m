Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 962075E8EE1
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 19:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5348610E638;
	Sat, 24 Sep 2022 17:23:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D43310E635
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 17:23:28 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id d42so4922833lfv.0
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 10:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=eE/Re1Zix4MLMDESnhyXIaVTrN+pH4fXX+7CdENuln4=;
 b=NsqKraFXmKU8sAJGtgFwo9uYMPsjN1jFgnCU/afP9s5cajyKX3oQ6suovZ3rHBrUkJ
 zzff0GTK22+9+g3bMIIflHXq1vPWRNY9v6Kuq9wrdwWH7qWo/5DDpAcMC42Jq2wWSyIV
 MlNtgoH6pFDHmcNBOK0+AfXEuChuQh+o5ha/Uy3M2QgBVL61OrhUgk/y5md/gnqEktpk
 6q7EhwC5oYFkUM6xbjnXi43E16IgKDjwACEyMISKKuj7XUXkssWveVeGWRJvNfJg9xv3
 9wGIXCLrLDU+3t9qwWY2Upvn8pPyo4/NCYaagAG+8WIzUXE60gEH+qnmSUmo3ufd4BpX
 g+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=eE/Re1Zix4MLMDESnhyXIaVTrN+pH4fXX+7CdENuln4=;
 b=yRjGXXCUwVmt/6yFwwCU8uzEhItcsXPAuBpluRynTDzBve/IuNAD2OWNvZlAKVa/zM
 tnK8pKy3Ni2jGiNbxmM5cN2v5Z5c6dertEEjdK4US9pNb1lGkZsEAgbwxus5MDCm8aZd
 CaoIhQpk9dcwadIqYoJv0YL4nizy4S681ifhvsP7teGvfr6zGng1vRAOg0SHW07K6WZb
 dZpiMqUuFJgBTWu+nWz4t3+xHNrKN/Lm+gdCKn+uTpq93DJRws1kfueVPHO7IFJURKGC
 T6lWLQJpD9UMloBdzENnOOIhTp4yyz5fGDFeaA5+5UgW1bpo1BLkMIh9yKzqXScol9up
 LBXw==
X-Gm-Message-State: ACrzQf0PgjOkThZOJbrDy34jXoztByKzQiJzd7XQ9oxEqxYKPI6nex/6
 5CC/Z/aEzskermnufDXbOLeOuQ==
X-Google-Smtp-Source: AMsMyM6L6jT5Wgp0eexIvy2f6PcmVIhOV2LU4f2eXI7kOcoBQHEDmhJrnRh4w+6w8DgwGgaLeqvxJw==
X-Received: by 2002:a05:6512:312d:b0:497:a3df:a08b with SMTP id
 p13-20020a056512312d00b00497a3dfa08bmr5209846lfd.462.1664040207079; 
 Sat, 24 Sep 2022 10:23:27 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a2e544a000000b0026c5dce1f9dsm1770656ljd.106.2022.09.24.10.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 10:23:26 -0700 (PDT)
Date: Sat, 24 Sep 2022 19:23:24 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <20220924172324.qdgz5dnccncadmfz@krzk-bin>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-4-dmitry.baryshkov@linaro.org>
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
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 24 Sep 2022 15:36:02 +0300, Dmitry Baryshkov wrote:
> Add interconnects required for the SDM845 MDSS device tree node. This
> change was made in the commit c8c61c09e38b ("arm64: dts: qcom: sdm845:
> Add interconnects property for display"), but was not reflected in the
> schema.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dpu-sdm845.yaml    | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1681884


mdss@ae00000: 'dsi-phy@ae94400', 'dsi-phy@ae96400', 'dsi@ae94000', 'dsi@ae96000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb
