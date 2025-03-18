Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6F8A673A5
	for <lists+freedreno@lfdr.de>; Tue, 18 Mar 2025 13:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C65110E472;
	Tue, 18 Mar 2025 12:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gKwHangu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2852010E471
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 12:16:53 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I9KW43025504
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 12:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=dgvU8svwebeSekgWfG8Ih62E
 R31eTU16D7J6+KvsOhU=; b=gKwHanguLb3HGoK43kNjG4r5T7qWdF1y0X2DCVhs
 rZn0l/6NI4NnwmCaPtQ2gchz/47PiAJ58GHQtgiKKI9JPEFOuw6Gc9BSpXVkvySU
 RJQO0XhMmzVs98l1MDe5j+yT2r6tnrHRAwAZcFzIrtbIe3UGTkhV1l9DL32CcukW
 swG0WUvF5QJZLHG+uN+WNyo+QTGxc0m141HOOZaQIO3MPE7LOzVHatCZ/Dhm+Uti
 OTW7TiPYbHtWn91dHFgnXEQs69tCCB+rw3jmwKQu0NUH/U+/3tGLFDPb0v7ET2BA
 rQZSZNk7qEn0NllFMaznEc3K5mNI01XY/7o+pRFkBozSfw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1tx831v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 12:16:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c54a6b0c70so593334085a.0
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 05:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742300211; x=1742905011;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dgvU8svwebeSekgWfG8Ih62ER31eTU16D7J6+KvsOhU=;
 b=cnQPPSZ80JfXyoWoTVgpi0rnG8cRTsCy3khHcSqSJtL2nrrbJ3xaRfJM4Ovo/mB9FQ
 2V8pjjwqfalnEXqFz0m3JUJmM9pja+9HYqV+4Ga+bFPaT0+5lAJR2h2E5Es07V1oCS+k
 vPH2yIzg4tStZ3X9qPK6QjhF0NhqSNo1wRGY1l7T3VB7FYNB1SerD0KKjWOucGNIJGpc
 ouy3NXNNUB93zZ7f8LW3bsEGk8qGkFVcoa3drQtq2zhsHeHn/WeOecrOak6V5GJSBndd
 Ig9hETB2/3EmKifcguWEyGJd5cygp1gF+b03LjFGoEcWapO9BgcDgBdlButGAVqCg8sf
 QKmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhM+znQ17VYrik3jSG5HLZfTeXlAkjV1v4pnG7chsyvM4jjCPpHT78q/Ai8F0+Q9hwFnYBkjh5BX4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFXS7awsDL98b0bfrVy/cpO0L3yZZJRrlydFF8yVipJ9eEv73m
 uae4xguXJgMOnHhKHZKQQ3qwxb2qGFwtkWpSWQ7jf2grMU5Gi3+FdKT5NrSIKfRY11lc120oFVN
 r+q+Gbdf+cXCfdltKMbMPCd9ij20FDAFPn0da9BRh7nlxVO7ETuDp2OS7R8k5IRUTyO4=
X-Gm-Gg: ASbGncsLOM5Q6k/GkClZ/4ZocOqMzjJP7YkgHZh2MRdzW1trTzcVtmYcm82xkF8g1/9
 cWu0pTqwwjwjPXv8UVtkfVv9cSHP2Mm61kXDIkISUB34kt9WymMsobzKS2x674Ri8Rl9QVmnZIv
 7HKvjEcifQgotnteMevXeaCR/2FX3m12/PhNPYwxqKMiCKvv47iy+AFoSw5uz22FbcaOKpbkN+A
 4yHZMMjZl3TSFM2jQiUatMDD8wQhHaiL1vs9b8Kqfc9vaMnS1Ii/BTyNDiYcn9fQ+/S8kQ/1BTu
 +AQJ9TCQRP9M9HAHoA7GesJqK8K5Q3H3IQgMEvlsyF057KiL0DxbSh9920IJkGVXsMV4qFGMeg5
 PRU0=
X-Received: by 2002:a05:6214:ca3:b0:6ea:d604:9e49 with SMTP id
 6a1803df08f44-6eaeaaaa3d0mr230068396d6.34.1742300210846; 
 Tue, 18 Mar 2025 05:16:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/QbW51i2QEA7DNMKYUIPNpOuBwru1TWa+7+ZdqHkmL4IbrVh78rOti4S492Vx7r0OVx87UQ==
X-Received: by 2002:a05:6214:ca3:b0:6ea:d604:9e49 with SMTP id
 6a1803df08f44-6eaeaaaa3d0mr230067926d6.34.1742300210482; 
 Tue, 18 Mar 2025 05:16:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f117b8fsm19530991fa.63.2025.03.18.05.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 05:16:48 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:16:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
 Andy Gross <agross@codeaurora.org>,
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
 Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
 David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/9] dt-bindings: display/msm: describe SFPB device
Message-ID: <t37wdbwkbuyb5xn2lsdynp7on2oujvojmjkba24t4lqxuu64vl@htfidrpftxx7>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-2-655c52e2ad97@oss.qualcomm.com>
 <20250318-adventurous-cherubic-coua-eecbbc@krzk-bin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-adventurous-cherubic-coua-eecbbc@krzk-bin>
X-Authority-Analysis: v=2.4 cv=W/I4VQWk c=1 sm=1 tr=0 ts=67d96433 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=JDiau87qNJ9ckCeAMI0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: Evgh25CpY8bVjrQOg6IhYBALd6XSGWAT
X-Proofpoint-ORIG-GUID: Evgh25CpY8bVjrQOg6IhYBALd6XSGWAT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180090
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

On Tue, Mar 18, 2025 at 08:55:59AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Mar 17, 2025 at 07:44:37PM +0200, Dmitry Baryshkov wrote:
> > Add DT schema for the MultiMedia SubSystem System FPB device, which
> > provides several registers to control interface between multimedia
> > devices (primarily display) and system busses.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/display/msm/qcom,sfpb.yaml | 39 ++++++++++++++++++++++
> 
> Filename: qcom,apq8064-mmss-sfpb.yaml
> 
> >  1 file changed, 39 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sfpb.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sfpb.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..7ca105c97edd2f305527c58ae89b9b0cf22d3c8c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sfpb.yaml
> > @@ -0,0 +1,39 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/msm/qcom,sfpb.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm MultiMedia SubSystem System FPB
> > +
> > +maintainers:
> > +  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > +  - Rob Clark <robdclark@gmail.com>
> > +
> > +description:
> > +  The SFPB provides several registers controlling the multimedia attachment to
> > +  the system busses.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: qcom,apq8064-mmss-sfpb
> > +      - const: syscon
> 
> Why this cannot be part of standard syscon bindings file? Looks simple
> enough.

Ack

-- 
With best wishes
Dmitry
