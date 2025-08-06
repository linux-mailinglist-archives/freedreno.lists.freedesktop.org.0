Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A96AB1BF65
	for <lists+freedreno@lfdr.de>; Wed,  6 Aug 2025 05:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDF710E2E0;
	Wed,  6 Aug 2025 03:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mzCGJaoS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7923210E2E0
 for <freedreno@lists.freedesktop.org>; Wed,  6 Aug 2025 03:47:05 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761f7rZ022817
 for <freedreno@lists.freedesktop.org>; Wed, 6 Aug 2025 03:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=uzO3gUvM2oUa6aLeaVCj3dH+
 MS759piHbjXm21lQVQ8=; b=mzCGJaoSZ6f1FgMO9zeG/iAb9tlRkfedI/WzWEC4
 LcHol/+wg/+ZmGqYtYExKN+kWeXgPNAnDtg7+NSuTtEFo6eTiSJ+82NQ4022vci9
 /ZZPLtUY9J03B1W7pLyDCk/C+3Vlw5NTkBwXkOy9/rnXC6vT2dV2bF5mQk/TBScH
 d9VD6cpp7NxN14fnq39hAg7sBv8X6RvRmxeyiLbuy0h9lsy48MIwCDw2wNrBlksj
 2PAY6PMSpoFvIKhwzv0b23KCPbDqyG7+VekHY/Z8D4CybckxEOcswoxN+sAkRBPn
 r90iR0zqHIBrTP5DYFUetO0iG+Xv9YvdSC0e8s4tgd3LDw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw31a65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 06 Aug 2025 03:47:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e696444d0cso793221685a.1
 for <freedreno@lists.freedesktop.org>; Tue, 05 Aug 2025 20:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754452024; x=1755056824;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uzO3gUvM2oUa6aLeaVCj3dH+MS759piHbjXm21lQVQ8=;
 b=AFaoQ85gHWoY5d6g1biw3/RmF/b3LqNFw4ReNU+nR0kNeU45yPfgGTzHX0Ppdj/rmM
 H5n0WtwcamG0OdAKFXk3P5o3gyrCPkfRZLg7x9Pr8B878Wdw/7avAphXp2+ex99aSSX6
 E2/hpRfBaz0ONnxbVy+iq7ZIylfWHSXxmT9zoV2Io/Ml2cG/atp21QYihCrNK2YWFbLk
 VIxdTmoX6auFrT0Jf/YVQzRNmfjd7jdkGTCxeMnWSFK5H1xitM5mUApwb05y1BS6CiHK
 RBuHaQy7GvLukvFZ0b/UaGxa7PQBp9EHQAnoR7BKqPxFcRwroxNaEw7U0lLv38w+rMYB
 1J8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL9YGEyxLitCG9z9C5bmnLo51T7n5eH4da10JyIvN/RaAjumTzoLZGKGw7PvpgBnsRC5RYOVyRdcY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy294dapGdSQCshWVDgQMvo4cUXfiGCVF0v81rXzkWKx6jTpPRw
 l0+SQK3aRZXhU+gJnkmZg5NU9kI5Pycj7Z/POSs6JdCoQj+eAV433ibL4m1WdVoSdNMw1akrFo4
 yic1TimJUsv+c9Z96Zm/LU3RaBNP8rCCscHvGqAOhO/9W7KWcKUP6FZDk+Pebicev9QIWp48=
X-Gm-Gg: ASbGncs+72tPlVP06oTmfDIV01fL8d6ZAZHfzpAKsk6KmXIsm3aQvmSjnpUxtvXoW+J
 zzKGX1b2h8qaN88bMJUv3dnKfasK0T0Loq9sDC2kxAmfkOU3Cjl9gvYvbtzclH7rdk18RzCXf+B
 DR8YdJjDUlLOMF++9Blhj38w6MMb0QhgoFqwSSxiBTEqMZAW/v22fQ6+nzx5k1fAHGKiLN0nR4o
 bKrJjWTIxuZzvylLrvfovImbXFBQCJ+TBVSblzCbbQ6P2Rukcd9uOuw9Nc6NCYqQoXsD/hRcFUP
 nv52cl9vIfCh9y3Wlk3jPW66pXX/1p5XzcFnW+SJJyYwtt21aWY+vh+OyvGCzQ8cKQ38//EFjwu
 kUmuJxBmfuyy1niT3N+4tKTWuXweQPW2MeDKzGEPSeUL7TEzwlVJd
X-Received: by 2002:a05:620a:aa13:b0:7e3:49b5:d53f with SMTP id
 af79cd13be357-7e814eec6ddmr188022085a.34.1754452023502; 
 Tue, 05 Aug 2025 20:47:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETZoK/bA2Y9Krb11P0NcogumIV9weE+6Fu9JMkAUX39k+KYb80V4r912KnrkZIKfzAnXHpaw==
X-Received: by 2002:a05:620a:aa13:b0:7e3:49b5:d53f with SMTP id
 af79cd13be357-7e814eec6ddmr188017985a.34.1754452022876; 
 Tue, 05 Aug 2025 20:47:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88db2214sm2114064e87.177.2025.08.05.20.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 20:47:00 -0700 (PDT)
Date: Wed, 6 Aug 2025 06:46:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Message-ID: <b24ln55wgmjzksugbowgilxqbnp6d6mgq4cdqljrj4jftuefa5@gjcszc3t4bqg>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
 <20250806-mdssdt_qcs8300-v6-2-dbc17a8b86af@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806-mdssdt_qcs8300-v6-2-dbc17a8b86af@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX7AjyCAc7zAJn
 hQxzuXb2mqSjuMW35datGeBOJ0fbGo/M1yALOXH4CLU1QaQhx5I1zWsPQ6Da0iOaOlthtdbBAzE
 pSY0nCN4aIZFZPrG5Bx7Bod/hnZxT0S0TJsxdwhMubLUO/5RW3Pm5pUrObwa/S/8IqHtr8CA9UF
 jMAG24m19FEqQs3nOp2rBdxp+6TQHoyrvmeob4QVipERQFQSxJUOA0qfeP4gqW9j/u9CjlEFJB4
 XpNdT8mTXkNUyrAc9OUz/viG/mShaWKf26aZjpGdGt675Ok73y0sDvI+ZZPLGYuh87U0lNlJe0L
 Q0bJYjc8u6rE39kc8Td3no4reEts7GPGcb9s7qbh/9WYq6hYTeglR/zfstJTAilaBvPFnI23xr5
 0rNPuEhq
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=6892d038 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=q-PZGS4JpPPfnBF8F2QA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: QOKOgDvuF-YOyVdDfKUkTDW2aSlvDQ6a
X-Proofpoint-ORIG-GUID: QOKOgDvuF-YOyVdDfKUkTDW2aSlvDQ6a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008
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

On Wed, Aug 06, 2025 at 11:16:46AM +0800, Yongxing Mou wrote:
> Add compatible string for the DisplayPort controller found on the
> Qualcomm QCS8300 SoC.


Typical comment: you've missed the explanation, why it can not use
fallback.

> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 2893f097df826a5f941fbb754fb4a96a1e410a70..f5930f29c91ec95e9182c7b8ee83c0549c6657cc 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - qcom,qcs8300-dp
>            - qcom,sa8775p-dp
>            - qcom,sc7180-dp
>            - qcom,sc7280-dp
> @@ -186,6 +187,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,qcs8300-dp
>                - qcom,sa8775p-dp
>                - qcom,sc7280-dp
>                - qcom,sc8180x-dp
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
