Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC7BB09F3E
	for <lists+freedreno@lfdr.de>; Fri, 18 Jul 2025 11:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7694610E339;
	Fri, 18 Jul 2025 09:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQSZ7BU5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9DA10E339
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 09:22:39 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I2og4Z029884
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 09:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=l4Bx2iCFIl/1j60UCxhXPVtp
 Oq+pJHhUuf5UW9x1N7E=; b=XQSZ7BU52GlkNRUFI3zB8w9KISomjNq9e8VNO+9O
 OaLWR3EMlPGzhlPyBq768nfk7kh5ojgNwhbwSze/WYH/WjiurDGyL27uRy8FkJHa
 PAQf6JcbzbbYbcATiznllfJItn2xgKGWCQvLOsZ6MtmV0Kk6XLa6Xkjn3hrqAhD7
 882C0NfHXc8f+7TrpOGdgAaMpr//Q4AheeE8R2QFAxcqA/Ab89ddRgQ41jF5XTya
 TnO2pGwaBlIyPB2ATlPRG29Gw0nKA1U1mi4Hs7BY+ZGpkIPAIcMkne8QY6czK1rl
 e3e3uBNYD7ORFnFJQpLwxzWscuJkZyRtXQxLFjCsb32ptQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7qrwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 09:22:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so340167685a.1
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 02:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752830557; x=1753435357;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l4Bx2iCFIl/1j60UCxhXPVtpOq+pJHhUuf5UW9x1N7E=;
 b=KZGfWofGDSdys0GO6OgvKxZdkKLIcRk/ZsJ+lYR906vLmcKxv2qkSOjoBm1wqRD9ou
 JLncXPjHoj2NkrL0F9Ed8UItGaE+u0LU4PF+aXVZdarOFhrP67G7hOS5991sWNqsRRwg
 7lM61vcbbjrMniGjThY0oUdCPlOMRThhij2bspFuV5I4AMLP3zdorOaFeskM1bDJvqcy
 X4Z1daMZgay4Qrk097+yBJBdtPJ1j+BDEy2WQdK9vL1a3nihxg8PFQeDs89KdRO93Pt3
 NdafeSOD5KxUMviu9DD6/zmI8rAorlW4oxa1DsCKV2fc0ZmO4rEuQDFsiYU1784BSiPN
 JsXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgQNQRMfhtqtxwOuPkoy8u0a6GwjD9NfIXlorRuVxYS5UKwxXJK1pnmEgLd0gH4yozFkiOFEdIY+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyG2ZxUKkO/1ioJWyN8akbVtaieOuBgA3a8nInVvd6TJJvUFZi7
 mVYz1IjX0wJ/zFJuH6x5c8RcjD6EsJmtJQqrpec6tvP6iaYCVeHwzGHpOPN/xTAWQTnNsKuZ0VN
 9egj3K5XWghEYBoQLHVBwyHarDHYVd/p+4L3+6iZIgGOvFXiugQ1Z2ZYGvMNN3x44bgjC7+k=
X-Gm-Gg: ASbGncu9sqcLyZjWPOJR51f2I+ujUov+zYdm01mbzpS8F4mS63vJ/n0ci0bUe7rkjjD
 UqX1+jJOPxFZtwR4JNZAwHxoGKK9cRB3tQ191L8Z3obmrPiNO51ztycdWzYB2SoyCXuD2lBpEN9
 7gcN5hnWQ+reLz9thrTagejzUh4IpM1RKWC8E8Tn0LQdO9JqZ0KlU7ARk/H6lZYf6UfHPyl42An
 mmT975MMfF0ang0xf5v/be0yCLlhznA38FsarCijfoArqEQVALjKq9bL5mEYekV9UDe/7KWYe4J
 ozk1qk4dNMnPgY0hVyA2SLgRaahM+n9IjSKZrcZvJ1J0zDLq30tPEIqX4s+2GdpivTxPCzk3aUh
 O15B/teV3RUfLpHXKJQAsUMDfL6yX/9Iib+lIwtcaGnNKYRpVjxWR
X-Received: by 2002:a05:620a:29ce:b0:7e3:4a25:7fce with SMTP id
 af79cd13be357-7e34a258117mr1168181285a.10.1752830557294; 
 Fri, 18 Jul 2025 02:22:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH82NZy4Ihot0adWViWUtkoFyw87FgT1XTtuLHusFtAO0oAmIf+unxWzarpa7mXsBrzakAEoQ==
X-Received: by 2002:a05:620a:29ce:b0:7e3:4a25:7fce with SMTP id
 af79cd13be357-7e34a258117mr1168167285a.10.1752830554782; 
 Fri, 18 Jul 2025 02:22:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a90d4f6esm1477431fa.9.2025.07.18.02.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 02:22:33 -0700 (PDT)
Date: Fri, 18 Jul 2025 12:22:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Danila Tikhonov <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v3 0/5] dt-bindings: msm/dp: Add support for 4 pixel
 streams
Message-ID: <lekqhgqzb4iimsu44y54cvxbasux264lbuqsbssj5nd66ocvji@nfuxnyukujjy>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3MiBTYWx0ZWRfX9URyM3FRaGfQ
 k0KZgNy9tpNMRG9+RHAiZjrG12tXjlm5G/9O4zgSwigjR5Rg+lPYtAyhu0qwTQRjBl3yKvwyjzD
 yBibm57ABKZ3b6MoiKWstk4n+3t6VNn0/gOqpgf6wKkLge4sa6VCKyDycQhEWV4wWhaEfP6vhTK
 CSOvKqEA6CoFH1bZ8U1qPdtXbRnO8XhRRNndcWVSkWRxiXeH3yACmEHf5EXzgcDEYGgbqfdtJ5n
 VUoWL4r0jwGf2QXM63jTsulDTxx9uCsmqJpyLRLFpa+HMvpRUg+nLmSrKoiqvCtXFH9sO2qKpsC
 oDgYIcXIumlRBaNO580ACdWl5AY7mHIxCIzhKIgIfzeHzaPmi91TWiia0mBmnx9AYdfbGWr6Umc
 rAgQQbT8YJUKG/iAEXjt/9hnNv0fcnC9RSMlMJXqdXf0Nfx3k3qnQ4lqQPtijMXd/KM58Gl7
X-Proofpoint-GUID: egf5TKERG9GiZQmA1M1vcls2HK0KaS-B
X-Proofpoint-ORIG-GUID: egf5TKERG9GiZQmA1M1vcls2HK0KaS-B
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=687a125e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=sO8KT4aWJjNtAKDlhegA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=921 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180072
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

On Thu, Jul 17, 2025 at 04:28:42PM -0700, Jessica Zhang wrote:
> On some MSM chipsets, the display port controller is capable of supporting
> up to 4 streams.
> 
> To drive these additional streams, the pixel clocks for the corresponding
> stream needs to be enabled.
> 
> Fixup the documentation of some of the bindings to clarify exactly which
> stream they correspond to, then add the new bindings and device tree
> changes.
> 
> ---
> Changes in v3:
> - Fixed dtschema errors (Rob Herring)
> - Documented all pixel stream clocks (Dmitry)
> - Ordered compatibility list alphabetically (Dmitry)
> - Dropped assigned-clocks too (Dmitry)
> - Link to v2: https://lore.kernel.org/r/20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com
> 
> Changes in v2:
> - Rebased on top of next-20250523
> - Dropped merged maintainer patch
> - Added a patch to make the corresponding dts change to add pixel 1
>   stream
> - Squashed pixel 0 and pixel 1 stream binding patches (Krzysztof)
> - Drop assigned-clock-parents bindings for dp-controller (Krzysztof)
> - Updated dp-controller.yaml to include all chipsets that support stream
>   1 pixel clock (Krzysztof)
> - Added missing minItems and if statement (Krzysztof)
> - Link to v1: https://lore.kernel.org/r/20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com
> 
> ---
> Abhinav Kumar (4):
>       dt-bindings: Fixup x1e80100 to add DP MST support
>       dt-bindings: clock: Add SC7280 DISPCC DP pixel 1 clock binding
>       dt-bindings: display/msm: drop assigned-clock-parents for dp controller
>       dt-bindings: display/msm: add stream pixel clock bindings for MST
> 
> Jessica Zhang (1):
>       arm64: dts: qcom: Add MST pixel streams for displayport
> 
>  .../bindings/display/msm/dp-controller.yaml        | 53 +++++++++++-----
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 14 +++--
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 11 ++--
>  .../bindings/display/msm/qcom,sc7180-mdss.yaml     |  3 -
>  .../bindings/display/msm/qcom,sc7280-mdss.yaml     | 12 ++--
>  .../bindings/display/msm/qcom,sm7150-mdss.yaml     |  5 --
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 11 ++--
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 21 +++----
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 34 +++++++---
>  arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 10 ++-
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 20 ++++--
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 72 +++++++++++++++-------
>  arch/arm64/boot/dts/qcom/sm8150.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/sm8250.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/sm8350.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/sm8450.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/sm8550.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/sm8650.dtsi               | 10 ++-
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 30 ++++++---
>  include/dt-bindings/clock/qcom,dispcc-sc7280.h     |  2 +
>  21 files changed, 235 insertions(+), 133 deletions(-)
> ---
> base-commit: 7a88d609b069b7d2f4d10113b18fea02921bedb1

Can't resolve this commit either in Linus's or in linux-next.

> change-id: 20241202-dp_mst_bindings-7536ffc9ae2f
> 
> Best regards,
> --  
> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
