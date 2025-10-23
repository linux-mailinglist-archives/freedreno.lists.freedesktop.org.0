Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE419C010F6
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 14:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E6D10E3FA;
	Thu, 23 Oct 2025 12:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FTtuAEou";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532AB10E3EB
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 12:18:01 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6u1bJ018601
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 12:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ROFrsQyZm8CifMY+KSTeuljF
 MGnyvNU7m+oJiV21M1s=; b=FTtuAEoupXC5vdrrdyN6IxcUq+6yZemCgio0oCQD
 O9ESPbFCoEwgoO2OgxMOD4PaaBGiBmf+bgtaj2PgIlTDRyDIqGK4mBVXszrWVpUR
 UUNWk3SbmrypTznS/u7oqEM+4wMx0ut7ONpVxXg0S1wqoD20QmgEhwYQAsFiYupQ
 7U7+ivuGwHVztmvC9c1vPYaBbzh/OGrF9se0c4J/FISDE2dUOihmXbGmNDOgROpU
 bDzmlbt3MaYIQpFWQOYba6m25ah6FsUaWCdo7E6R36UNxkqTdMWoFG2lADYTOVKh
 fwwDNkgqpLrUA4yQgPu/k3l1cBeuD+I5TmTZKWRZFYhI6w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08prjv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 12:18:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e884663b25so23015311cf.0
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 05:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221878; x=1761826678;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ROFrsQyZm8CifMY+KSTeuljFMGnyvNU7m+oJiV21M1s=;
 b=RDzVkdeiAVNpfXjRs99u5DRKAqi/GBMvszwASUjw07BdXb27TlFiXtaPs3tAmpE2X1
 twcqCuhAwZzwshZzItGwd1/oDGUnb00H9ocuWfzqQoR5mzlww8N+6IT+nCz/H5DHi9q1
 E5ni3GzGyxPBSx4PQCehm9PYnc8u4qmwxZP2G6coU55Z+0iJ6mYRcO2v0WOIhGiI6CSS
 k7GQb4qMNW7fyQk6Xr9tabUYAe83s/8RZV8q6O0aBGixDUG+GaPD79twT1wkNDwiPWQZ
 y7jFJ4JMan+0hYOO3tFUo8zOeOI2U67d+tYgmaw2aQGKWBMsAdQHOUS2FBDSh2Og02hO
 AX+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6sBDLDTnHmn3UX6cka9YilCsBENpjA+/gw+nPoXA6MkKgibbb8HAsAkpl4pw6M2EDO4aw7a1xokI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCNEO/CGlHZdy8Q+RGG95Tens+zi413Djt5gFOGt3kXM52tXnk
 Xl0xrr3bMHzPtvu5YYTY/qZTavQ9VBHRg6kjtpU/ScEAxMQP2W+fIqV1pS9aGsfp/weAR6PFqZ9
 0u9HxXHvGuN3hbLjO8SJKHFPPbp01jyhHUkz4SEnP4V7Pbkus8jYLD5mvs2/oBAxuDwWh1pY=
X-Gm-Gg: ASbGncv58m87CmJUT2hhiKIfidimqYdNxbbvUUBIms7KGA0irv7C9Z7VY58BrZ+WeFJ
 5FM0HJi7qmBNUMKuXVF4+eFvNI6FmXEmigtOgQJSKoWOGyVnwEvYGqIvf5jx1ii/qwtuJJvKvUB
 oRkpq90Cy4JBr0DodTUwDi7D/EGYjLXQ8Lp+8FT7vb5+t8TQhWCpbsLVZehYyqKjgbP4YvrBzhE
 vzkehre+Ux1JQeuQyrj5qMtNBtSFr+flt9fJ/svP/o0UeoIvsIDW0BnIAatGa5+5OYRstOv5P09
 ZQZsgPIQT6cUTbrO21vEEXkPuQSwage89rtMbzVE/K4EafxvRH3JpEWN5m83faV2I0VnAhHgxlr
 SzkyDaYE0qrj3SmngGuwoBq5oH9tLoC7SQWG1llZby4lv8//LgL9tAo6RhP0X5+8N4MPsJvZ8m2
 pgD4QJeuFdOUYr
X-Received: by 2002:a05:622a:1b8d:b0:4e8:aa15:d927 with SMTP id
 d75a77b69052e-4e8aa15d9bfmr268551341cf.47.1761221877846; 
 Thu, 23 Oct 2025 05:17:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM6vcDVrWNof3DbeXJ3ZyXrq6655uWMwZz0bKDp8nNSSm+wXht2S5o3XqgeX/K+hhx91DY1g==
X-Received: by 2002:a05:622a:1b8d:b0:4e8:aa15:d927 with SMTP id
 d75a77b69052e-4e8aa15d9bfmr268550861cf.47.1761221877374; 
 Thu, 23 Oct 2025 05:17:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-592f4aded25sm697972e87.16.2025.10.23.05.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:17:55 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:17:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 12/12] dt-bindings: display/msm: qcom, kaanapali-mdss: Add
 Kaanapali
Message-ID: <3jjgcha25ieekpulyc64gafyg56n66emr2ibmtdyugfsm6tjvh@rkhrs474vgdc>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023081736.1251-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023081736.1251-1-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX7wQJtqDXXO3h
 0e5hHgZPiVZzFcxqKvwJIklHmlxwmjCMvjPrD1x5KDA/j+kjcOMlBpqqjMg9y4AFs0U/fwAYNMF
 cj2cgxRQUw5bezh+nOhj7PyzymSIKjtxNM8x2HXrPrLjmo8FG1LFPkJY1K9EEbUj7YCGyOqln/c
 HfkV9RRY5q7eG8QsyAYGji3GuEYnOfrlEcY03y3vdpX7cGSx0OGXtWJyjgRk6SehxALLQCytmV+
 kWZaqi6qHJYPOlyhEbEPKlx0oPU1uSo85jw+mw8B1wlOkYO28Rrrct02Gfy49aFmtpWfpaOVmIU
 Xhd2HC5V5GLOCRJgWW1rSafINSKpt9y9ctXmSrYzITH/UTHtBS9AtG64BuZ0ivu9NJgyB8bYbD7
 qqw9njXl5EUKaQe9WqP0qToBYZesZA==
X-Proofpoint-GUID: OCZvWYCl6vv8zaxuYby79oEC6LQ8PoYd
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68fa1cf8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=UAfhHCFBB_nVBZkyMDUA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: OCZvWYCl6vv8zaxuYby79oEC6LQ8PoYd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000
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

On Thu, Oct 23, 2025 at 04:17:36PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add MDSS/MDP display subsystem for Qualcomm Kaanapali.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../display/msm/qcom,kaanapali-mdss.yaml      | 298 ++++++++++++++++++
>  1 file changed, 298 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
> 
> +
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,kaanapali-dsi-phy-3nm
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +
> +            mdss_dsi0_phy: phy@ae95000 {
> +                compatible = "qcom,kaanapali-dsi-phy-3nm", "qcom,sm8750-dsi-phy-3nm";

This doesn't match what you've written above. Was it validated?

> +                reg = <0x09ac1000 0x200>,
> +                      <0x09ac1200 0x280>,
> +                      <0x09ac1500 0x400>;
> +                reg-names = "dsi_phy",
> +                            "dsi_phy_lane",
> +                            "dsi_pll";
> +
> +                clocks = <&disp_cc_mdss_ahb_clk>,
> +                         <&rpmhcc RPMH_CXO_CLK>;
> +                clock-names = "iface",
> +                              "ref";
> +
> +                vdds-supply = <&vreg_l3i_0p88>;
> +
> +                #clock-cells = <1>;
> +                #phy-cells = <0>;
> +            };
> +        };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
