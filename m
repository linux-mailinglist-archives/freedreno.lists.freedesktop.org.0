Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCFAB2255E
	for <lists+freedreno@lfdr.de>; Tue, 12 Aug 2025 13:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A94E10E335;
	Tue, 12 Aug 2025 11:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ior0IhHC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AB310E334
 for <freedreno@lists.freedesktop.org>; Tue, 12 Aug 2025 11:09:46 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvgAe012923
 for <freedreno@lists.freedesktop.org>; Tue, 12 Aug 2025 11:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=AIAxtRxEWQa+PoJtNeXzkD9e
 1EVa70dohZybPWb7a6w=; b=Ior0IhHCvawSNtfOMAb0wwO9GSsGgFtfbT0jskDn
 kTzsP6w7UbfARCpo2/GxPcqdI9j89kWyEO/N81jPJI82WfeznF1FUow8rbsZk5ur
 GJoSfB1suaiYS0XrwqcC/eVaeS6WBS9zhu0umIQ/Zi3OAKE5hewjzv/bWgppG0Vh
 xyx/Xpu1YnOCuQSCr5MksIW9e2krGMhlufmrk5Ya8Ej6rmzTT9KUept46XB1QS6p
 11iPfwxhTsawKwaMcQlII0jZhKl4WwBGIyVE5vjdx6Smqraf75621YM2dKym1PDF
 Uh50LrIr3YJBhjhP3sGw6KmC36mvYSI23PVp3Q8LQKllVg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbb0tt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 12 Aug 2025 11:09:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e65340b626so1282081985a.2
 for <freedreno@lists.freedesktop.org>; Tue, 12 Aug 2025 04:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754996984; x=1755601784;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AIAxtRxEWQa+PoJtNeXzkD9e1EVa70dohZybPWb7a6w=;
 b=IfIez1WiYhHsooaF17YFcsXcHsnsCJqmXAgI2wlH5USoe9fpvoWQUpCqZpzd9WP3Gb
 p1GCqse9tMk2n+x7GP6uXM7FKZ5V9CEH/UjkDbrBcqqOwTKWWYQsbfUX50Cw1nMhtKRm
 LBXtz3D5//4hyF8S4X2DaAwZHM0BJCc1Fpke7nd3vwvRQTiY5H9G3UF+bBCRR1DX0kl0
 4RcgpavdVwtkTW0WU/VERLsvQPH1WoTwkZyf7teOwHZR145kKzCG0h66/YZZScMFmUmK
 YXlEdSfdc2y71vG8GjuBN+O7SEVGtMJYYOnx50eTFWB8xYDNCCspypScQ56w5+72EZ4y
 FKtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi8uDv1tnhr4vRvjkevC3eSmuKW5PfMG4XLYzBRqkEU+x8AaJSSVyArvE4Pn6BeSj6VtcwIvEqF4w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkL9eD0HClo19bKEE1x2/SdGX7+73jBx7jsw9rUrAjbzTZjFH0
 dghmtLGcWES8tOfBUhP1iM69MBGFZnURlcRTkjNGtbsVcUiy9El2KWZYOy2+9qFjEfF7At/4HCx
 8aCxOHpIwhHZf1ngx9Um8lkz6Dp93bC85lnEsdN1iL7KQwkB+kUzVwaTdRGf1vRb+lBAPBQc=
X-Gm-Gg: ASbGncum00FA32okRtv/k1CqW1ABj96O0Jk29p8XI7a3mwvJHOT2hj6d1MjZPrvQWBZ
 g1VJRQHCLZgN7r/7ALS0WuoiJZB1+Tyr3eILLPwopQmFTeVdGD0yV5bWhxMUebHtgsnVN2tANr9
 Lx7VJS8tAgPh1rK92Wv/GzQHEF7JRHc4FFTYzP4hdEoIfuU2Wio4rZw7h1LEcaNZpmYhPkDGSQk
 CW/Jy8Her0/zneMr4m1URwtqkfFzW3Shm4Ton5WQzeXJ9BV332RRrRMGL/MiMCEHkmLw62thcGR
 t71PDgzrcg4Vq5tK85AGcHq5rY+nLiTyLrmaZZ+f7FWTe5zpDSWwmvLuJDae/9txFR72Xo8sAF/
 vRL0F54RCO32p03a0RG2zOxrHp4hq8531ygRl5DwZJDHLhntgUMYi
X-Received: by 2002:a05:6214:cce:b0:709:76b4:5933 with SMTP id
 6a1803df08f44-709d5e65c0amr39757736d6.52.1754996984441; 
 Tue, 12 Aug 2025 04:09:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED8N/fj/UddI6LrtMKrLtwztZPaROzzzxE0FNZZIfFm57zKexaJ8AF75jAWjjfPAFgK3Z2zg==
X-Received: by 2002:a05:6214:cce:b0:709:76b4:5933 with SMTP id
 6a1803df08f44-709d5e65c0amr39756786d6.52.1754996983646; 
 Tue, 12 Aug 2025 04:09:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898beeesm4777002e87.17.2025.08.12.04.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 04:09:42 -0700 (PDT)
Date: Tue, 12 Aug 2025 14:09:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,mdp5: drop lut clock
Message-ID: <r27jcfvpnsyi7eqtmfrmsz6mqnvkevt6dgfqlsxen4zd37fbec@flsgd3mctkoe>
References: <20250809-msm8976-no-lut-v1-1-f5479d110297@oss.qualcomm.com>
 <0bda8e0e-4f86-458f-b55e-c5b0d6cd5c30@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bda8e0e-4f86-458f-b55e-c5b0d6cd5c30@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689b20f9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ywOSQKh1gFCfJaF_E3EA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX01OluqntnuZT
 mJLCjaKmv3zi84qQ+pXvkJghaYl4K6n0C451/prOXXgAQiuavAquB470+jM+uTrvEOlocYL6UrU
 G8rNqLMpAzkQwfY5HZz1XGLyN01KoNcwcrd4fEw1tH/AveJaPOACK7DnxhtODgEYjpIl+/1qU5M
 /uI0x5Q9QmgGBLAcipB0M1tNnryfN1cXkeexvjjk/kLj6wDxanhuGo3JGrhuJYcdOWpnBI0GPJp
 +way+InI0pLKzehgnr2eCjLrvSSvrXPp/h+T8ALxc1LtCIkcubir2Ux4M9nO3yoQgQDGV2IY3FY
 EWPg3pMjxOZv+dDKf21VjDXAdF9GY7XT1A4G8hzB4EKCN/sSLZ/W0Vd8LptmzZp9qJ0re6ZXfvb
 X8a6Y5lE
X-Proofpoint-ORIG-GUID: w0pGBdx73d8mOVNZoxzSm2Dl5rrB0Uxa
X-Proofpoint-GUID: w0pGBdx73d8mOVNZoxzSm2Dl5rrB0Uxa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097
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

On Tue, Aug 12, 2025 at 12:27:14PM +0200, Konrad Dybcio wrote:
> On 8/9/25 10:36 AM, Dmitry Baryshkov wrote:
> > None of MDP5 platforms have a LUT clock on the display-controller, it
> 
> 8974 and friends seem to bind it to the GDSC
> 
> although on msm-3.4:
> 
> arch/arm/mach-msm/clock-8974.c
> 4197:static struct branch_clk mdss_mdp_lut_clk = {
> 4203:           .dbg_name = "mdss_mdp_lut_clk",
> 4205:           CLK_INIT(mdss_mdp_lut_clk.c),
> 4609:   {&mdss_mdp_lut_clk.c,                   MMSS_BASE, 0x0015},
> 5118:   CLK_LOOKUP("lut_clk", mdss_mdp_lut_clk.c, "mdp.0"),
> 5387:   CLK_LOOKUP("lut_clk", mdss_mdp_lut_clk.c, "fd8c2304.qcom,gdsc"

At least it's not used on upstream (nor could I find relevant docs in
the HPG).

> 
> Konrad
> 
> > was added by the mistake. Drop it, fixing DT warnings on MSM8976 /
> > MSM8956 platforms. Technically it's an ABI break, but no other platforms
> > are affected.
> > 
> > Fixes: 385c8ac763b3 ("dt-bindings: display/msm: convert MDP5 schema to YAML format")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> > index e153f8d26e7aaec64656570bbec700794651c10f..2735c78b0b67af8c004350f40ca9700c563b75f8 100644
> > --- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> > @@ -60,7 +60,6 @@ properties:
> >            - const: bus
> >            - const: core
> >            - const: vsync
> > -          - const: lut
> >            - const: tbu
> >            - const: tbu_rt
> >          # MSM8996 has additional iommu clock
> > 
> > ---
> > base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
> > change-id: 20250809-msm8976-no-lut-4b5100bcfb35
> > 
> > Best regards,

-- 
With best wishes
Dmitry
