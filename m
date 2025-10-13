Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9DBBD303D
	for <lists+freedreno@lfdr.de>; Mon, 13 Oct 2025 14:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17D910E441;
	Mon, 13 Oct 2025 12:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Palj9H/Z";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213B110E457
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 12:37:52 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAcRBc022230
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 12:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UTXiDHZxjE5lYanBLZzc3WtP
 FhwD6zEyaiJPl3VCc+c=; b=Palj9H/ZHdSeQ9v8BmEGpcpToPtdkFkW8L9foVqF
 ma0Q1ih6Vl4BSwmHNHJip8SFxWjaPUnPkijbB4VH1suCrIPjty4Yc84bssgGeMkz
 YlcM7rGi7pTcoviN/WtNMDuncdFFQxwPk2wXEBMC2ddryPuWkzM/LoaqKh1gZds+
 Txq97tHGJjSZ4ihmFmyr+fYQUucuLypOmod2sd4WiKuelVCEp5Iyje9EZmhFaDsJ
 kREEkvjwGMCOFsY0eqoBnH0uZ3NvHxfrtABxbZozsX7wIGrFq8zrtlZet1NUdQWF
 3WoD985IMAHdfy6W+Br7NDrmgdCYGfBoBF8QKOC2Gwighg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfve05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 12:37:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-828bd08624aso2153447185a.1
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 05:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760359070; x=1760963870;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UTXiDHZxjE5lYanBLZzc3WtPFhwD6zEyaiJPl3VCc+c=;
 b=sK08ayo+eNVJRqJO8z4qBYZN9u6XyRyn/l1hix9XnMC4bmqfh637djcauCPWtSHB7A
 gRoOlxEJ+BE4ddLFl+FGFYg2JmVtbL5n7vYvsNSQ49KabGkK74vITbwEmys+9I/rkPTp
 ssOOjrd6nR3jNEIpNZfpp7Mc6G1U/kluCWG9nY8yAQzHweAluj/KZXdWPURertMB6w7O
 aC5YXm7vzzDEAEo/xddh6IPoI3/3yOAzfuyD/NgM2axvCNshWfCCedQzWw5duq+qHKRw
 KlBhY+N/2MgwQHq1UL5hF7kJbF+eH+zm6LTLqu4wgL+Co1PMmyOeMhQA9UvXHUtXT/cf
 rpSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQQLWX1WSXnXZUDY8g+YEGzZGx86o9fYhY2SWeXi34QvEy2ZLMj7pCJSOn3T61aKVQMblSbUaQmHU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEclzUIsBgXEpI9wY4zIWpX16a+IAvXbEjSupujHG2M5v5Kh/Y
 Oscv7qiV9TYnJEOBM0ZrjOkNdyUCm3W3ntfVINReqkGcYQnkTjBY9PK3liZWgarlTLJwRQwLVmv
 4o82EKmLO/qasuI3xYAw7D/5a+VDJjjoRBhk3NVdGuk366gNIIIYAI6cbq6M/C9BWCtdFurY=
X-Gm-Gg: ASbGncuz7FCVE7Wm1hRHq78VqgNOUmdNxU9wI2+H4ybP6xmLZYPxA2veV9EKVibits2
 mZ+OpBZ1NHoq7+ted9j+N6vC/cD16PWMCW7y0wjWP1xT3KAK+UYT6bzKXm6eRN7bOjDCxqY99uO
 TKi5YHOqmEhdtWd6XaQdUMhMI1BEN48CGxbF7vfapEJOXg6JLF6DDtz+m3ItVcvw2e5FCojWQ52
 B+jTDRRzJ0wxs5Bp2sa8HGzpH4u1pASPQR3ZWhHFsRyFS7dDiHKv43OLm7GwuevLFSGtmce9WTC
 0J2R6gEz9LmQ3VpE6DqpBgD26fo4/8sn8mWaCBSb9Uut/ovHIQWaFxnnYzZ98HamMQYILbarsyY
 1fPBs+887sJJ+pl76NpKjp0ZwkWbtNXUbmTxEdrg+mTgNnK8Q4t67
X-Received: by 2002:a05:622a:189f:b0:4e7:28c4:3367 with SMTP id
 d75a77b69052e-4e728c43476mr38351651cf.82.1760359070248; 
 Mon, 13 Oct 2025 05:37:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWOjldqO3QYpUkgEWR+chHtoaSrhdJCEvdufVafxS4s9vy3NHcZihffXxkbgVUGrgtKFOT7Q==
X-Received: by 2002:a05:622a:189f:b0:4e7:28c4:3367 with SMTP id
 d75a77b69052e-4e728c43476mr38351181cf.82.1760359069747; 
 Mon, 13 Oct 2025 05:37:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5908857792dsm4079248e87.105.2025.10.13.05.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 05:37:48 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:37:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, mani@kernel.org,
 James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
 vkoul@kernel.org, kishon@kernel.org,
 cros-qcom-dts-watchers@chromium.org, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom-edp: Add edp ref clk for
 sa8775p
Message-ID: <xofvrsdi2s37qefp2fr6av67c5nokvlw3jm6w3nznphm3x223f@yyatwo5cur6u>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
 <20251013104806.6599-2-quic_riteshk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013104806.6599-2-quic_riteshk@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX+BhjGqkgtf0k
 nLXTzeCVKOm1E3f2GP2LCVJ5Rv1kQTSw7bqhw4vFvesZGxapGvS5gzum/MgPphHdj2GBvhOB/DI
 mcxZY65qDmdddrJrzPIsD4IUxCRMuyy/K6zcNEPES7Qgotdx4ijPj4wMv5QfGy170V+d7kmkyre
 7YTdy2wL9vQiFB8oiIbOpMNDjOKRj1aDkWtbBqBpRrFAa7zDKUwuG1WCEvd+qmRjQnlQnp+rlTb
 4ILedlASl9sf+sGgCZuTHVKMPLM8+D3kJmkV3ow/T5shz92d19KLNDRfXqTpaTOh3jD/8ec4cIB
 7s5SZ1nsFCSO9y1ei2gkQ3nN2qyDVAnWt2Q0oQUkaraympQCMuPRnOI5zSu2j+YM1SkxFlfxXKP
 ybQclCcG4jzWSS554GFGTqVZ5s3F/g==
X-Proofpoint-GUID: iWqoeKBm6GmNfdmX0zsIjNO9csemHS-H
X-Proofpoint-ORIG-GUID: iWqoeKBm6GmNfdmX0zsIjNO9csemHS-H
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ecf29f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=1RwfRIOwSLSNpsoXFEwA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025
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

On Mon, Oct 13, 2025 at 04:18:04PM +0530, Ritesh Kumar wrote:
> Add edp reference clock for sa8775p edp phy.

eDP, PHY.

I'd probably ask to squash both DT binding patches together, but this
might cause cross-subsystem merge issues. I'll leave this to DT
maintainers discretion, whether to require a non-warning-adding patch or
two patches with warnings in the middle of the series.

> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> index bfc4d75f50ff..b0e4015596de 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -73,6 +73,7 @@ allOf:
>          compatible:
>            enum:
>              - qcom,x1e80100-dp-phy
> +            - qcom,sa8775p-edp-phy
>      then:
>        properties:
>          clocks:
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry
