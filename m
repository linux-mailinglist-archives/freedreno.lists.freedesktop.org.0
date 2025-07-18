Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EC1B09ECF
	for <lists+freedreno@lfdr.de>; Fri, 18 Jul 2025 11:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBFC10E149;
	Fri, 18 Jul 2025 09:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gl8Endv7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5ED10E15F
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 09:13:18 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I7u4tW015616
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 09:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XqdkQsTPxt7V80AMIAUMJZ7h
 FhUw+ACosjR1rjJFwmE=; b=Gl8Endv7QmU/nfL9/gxigtJswfLUlhZ4Iwh1dDO4
 paXBCU3B+06ttzNQeNYGckeAILV8ZKJC+9GWp8rHC6QdkhjlPbMpnFF87Ydn0rSp
 uBpodt3sDBgUZKGKjNTcbiEOP3nTDsHhTXzu++A4CRWS8ln73SWDPyLLjmAWZ2uq
 cgOa9shKAdCX+Wu18jJVwSSwybBMlZEMjYpKLP0O8SwW3H6bzbh3/HMjUzehhnsd
 jB/d6ij1WIgOMtMZgBBLmrjzYkBKEuU5Rr19ICBuudipoE2EGiMG6aT7iJyPvu9h
 DxOZLJvrLLeP17Dagpufn9vJSA+cn6sDMk3Qg9ZHkNSR+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dywuw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 09:13:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e2c8137662so317222785a.2
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 02:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752829996; x=1753434796;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XqdkQsTPxt7V80AMIAUMJZ7hFhUw+ACosjR1rjJFwmE=;
 b=feVnilLWtR/EZCK+72BCNwa+owMvHzdXQtAx5mHddfUAK5K8s/lqZGUBUS4U/ruEfJ
 uawb+jsh9yhKNbZfGvBCO7LH8Vuow3gTzK6xoeVT3+Aow1EQRjLCTwa93NTZvkk6SLdM
 N5Qkrrt/2czpk6hTmRd53WFDQGSGYIK6Qoo8pNNzj4kDDYq6zCLq/EHcIbvg43jmvmNq
 i+Wr3JXSDCDGpwPGs66RsX86+adi0a6+w+VsZ/XfRAH9QJRPN+cXsT+VzqRNs28qAN8o
 ERPFdLoZ14FZK+TLGBInqZu4Tw78WQFz9yzyCRKeqtFWLetBhTESjBOMlNuNtOgClpJj
 1jYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW89ytP6cBgGNyR3pzm+tLmaDKLK0LyawLxL/M5GlhJ3/UQ4i8sjJcphuZ6vyVVyGExOw7kkQ+5d1I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIvGLwsKLZq2Bhuy8q2FkklivohWt1tHSspsym6EOi0I2DR8X6
 R1sj4B98GiXeu9maJtH1E1WVRy8zQE2gJjNOjB69Sa+tK2EaVXNWMEgdNe/e2T/gip0J0B0akUU
 T/XnoCQN09NwtsV47qJCeE0b8EPh2wwCY/zALcfl/7W4kdL/NKhSB5QP4O5ukNlNwLdLzYPU=
X-Gm-Gg: ASbGncti2BKKs40aEUczC2P6iVwKoSG07XIDeedpEe84AlszxJmm0kptZaDKGA0hha/
 v4JspVsP9y7rf/0e7AbeaXnf+TIdZWNrrvX6WY70AFDT/E8ZMeqKayJyxPwFv5W967fr+yWOmdF
 iRqCN48KcXe6Zb0rmU51tJlPggz+UAsD4onTK9o6OS4Kt7GvxRX2aSI8WBVTlBr7Rktgq+iUAUj
 agpzCttXlwq8gHRjOe+JYMLIitYh8P6rYlsuWMEP8igf00tmc/PeY4VkUOrJ6+1q32KMLhugTSp
 5S0N5K08tOxgF6tR5TFNDvXlq0UaCayQR8goX4/M+/jttVPChk6bH+z+YfTFIjLj/fCv10QFvnJ
 Q6FprEabnnvnWycUeSxixd+ASp0A7thJXxmVyOYIqPw+q412tBEe8
X-Received: by 2002:a05:620a:63c7:b0:7e3:2cad:a101 with SMTP id
 af79cd13be357-7e34356ca74mr1333186485a.16.1752829996379; 
 Fri, 18 Jul 2025 02:13:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbU9LSFJQqHNFp5kpMH5LhaMG5b/m+Rc+Sp3X+lOp4tCy8yEj/Le//csSQhKYGhEm/cuwKrQ==
X-Received: by 2002:a05:620a:63c7:b0:7e3:2cad:a101 with SMTP id
 af79cd13be357-7e34356ca74mr1333182585a.16.1752829995802; 
 Fri, 18 Jul 2025 02:13:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a9104896sm1502151fa.36.2025.07.18.02.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 02:13:14 -0700 (PDT)
Date: Fri, 18 Jul 2025 12:13:12 +0300
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
Subject: Re: [PATCH v3 1/5] dt-bindings: Fixup x1e80100 to add DP MST support
Message-ID: <unwinuwoft6sfczcjlqq5kijss3ttggfbobs6ydw5c2lkmndc6@7c23jntiprob>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-1-72ce08285703@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-dp_mst_bindings-v3-1-72ce08285703@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Kb7yeYjANSgcwKcfd5mj44zggzjGKpwa
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=687a102e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=GX5c02JtZ_BarTZei1QA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3MiBTYWx0ZWRfX+dUoT06+KA3I
 ZXJlS3geaUVib2LuK20BQADYG1CX643wswiZgz2jYabkWh9GUHcN/BDlTsthJbDd47kdxGAKz2j
 hr9yCX6I+CU1JIsIU06kDgkVHZC/wNbsBrsBzoSuAcUpkn5CjTf6IkAe5eTtNLdMhcdjzhY2MN+
 ODzVp50rZijEW4Xf+BNvx9/pjuwLWR3oiwbuJ/9VbFKqp+23WlTbzApcIw9qhOPBJUE6VnVIgy4
 001HQYvNWaRMDYENOQQeNbfUcGm7EFuYmYH17qivEHbAETTLcgqQW76X1M32YtTw/zulk5TrfmJ
 Bu5TYyRE/3dPKDAQ8xiNAPDlbHQXWcKt0Q6MOVTP2jH2Cnedl+KBuftBTUlXNbBmlnrEe6E7gkj
 TamOQyW5ooY3Jg4wxz1wonR6DQa4THj77D36hafajE/b7nMWZ3Q63FQ5H5xs7kQSLNy1q/tq
X-Proofpoint-GUID: Kb7yeYjANSgcwKcfd5mj44zggzjGKpwa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=828
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180072
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

On Thu, Jul 17, 2025 at 04:28:43PM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Please fix the patch subject.

> 
> Add x1e80100 to the dp-controller bindings, fix the
> displayport-controller reg bindings, and drop
> assigned-clock-parents/assigned-clocks

Why?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml    |  2 ++
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml          | 15 +++++----------

Split into two commits.

>  2 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 9923b065323b..4676aa8db2f4 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -29,6 +29,8 @@ properties:
>            - qcom,sdm845-dp
>            - qcom,sm8350-dp
>            - qcom,sm8650-dp
> +          - qcom,x1e80100-dp
> +
>        - items:
>            - enum:
>                - qcom,sar2130p-dp
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
> index 3b01a0e47333..0e699de684c8 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
> @@ -170,11 +170,11 @@ examples:
>  
>          displayport-controller@ae90000 {
>              compatible = "qcom,x1e80100-dp";
> -            reg = <0 0xae90000 0 0x200>,
> -                  <0 0xae90200 0 0x200>,
> -                  <0 0xae90400 0 0x600>,
> -                  <0 0xae91000 0 0x400>,
> -                  <0 0xae91400 0 0x400>;
> +            reg = <0xae90000 0x200>,
> +                  <0xae90200 0x200>,
> +                  <0xae90400 0x600>,
> +                  <0xae91000 0x400>,
> +                  <0xae91400 0x400>;
>  
>              interrupt-parent = <&mdss>;
>              interrupts = <12>;
> @@ -189,11 +189,6 @@ examples:
>                      "ctrl_link_iface",
>                      "stream_pixel";
>  
> -            assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
> -                  <&dispcc_mdss_dptx0_pixel0_clk_src>;
> -            assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> -                  <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> -
>              operating-points-v2 = <&mdss_dp0_opp_table>;
>  
>              power-domains = <&rpmhpd RPMHPD_MMCX>;
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
