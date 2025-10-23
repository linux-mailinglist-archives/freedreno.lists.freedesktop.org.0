Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E17FEC010AF
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 14:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F86110E3F6;
	Thu, 23 Oct 2025 12:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CWyxHwSj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C4310E3F9
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 12:16:16 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6fAV8025832
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 12:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9bI46L/4oozpzEJG7ZAsQNzK
 TAJeVoM2mUGb1Do1MpM=; b=CWyxHwSj6udPgRngKWzY6aHNz7/y1XRW7WFZ6w9l
 RlmrmFeJXWPk9aG/2XNfqZM8YBfzklf+n9SJr7RRkaSsv12WCDpt1572JVHPyPNA
 IOK0kiy5iDQPG8RZiKZ2+FsXVkhoeZsj+BXvjQrb6npJj4YU7hfn4W8zMbzmkQzN
 DE9M6ZeGxXhBcKy3MXnVFUQNHTae5VtByMP+JZZU2mIjxT8m+BEO25FlSMkwprtL
 CIzHBGnsmD0tzL6tXq8EIMgFxg+5+Mr+sfOgE1JsafAAXEMRkEL8AzJeY2gw4wI0
 xJRtB8R0PEmJNV+CF6mtBm4wdldEVpLfBdjyBg1LMqMGKQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kg5d1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 12:16:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e895a6ca73so5501281cf.2
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 05:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221775; x=1761826575;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9bI46L/4oozpzEJG7ZAsQNzKTAJeVoM2mUGb1Do1MpM=;
 b=JzhvSA7tUuYKSE8DxN1LyqIVMMQdiAyiS9+LcFYE445EeAhkW8BczR+Z43P0zv4fZQ
 qIPeJxOKwBJp0beJLU01RTzuBio5iyKIpHhmzKFjZHu7T7j/fK1awIhzyVk/2rwiMS7I
 0RUmvCPs/3c413Sf9SYKhkZXmz4ZdP9oMmvmuEnspUjRSgTE8upGa7y2VXwcE+U7qh31
 fadL9RfCDzb3uykqmXSPYi3nu5HKEBJ7yG7bES1QCMQYM7NWKqRyRa/qli/Gw3WuDSvk
 1Sl4JAuf6+Y6hAbJ7F6imMuOtXRVi3sDxVtG9JZTkifK9ODnF+F81XWFD3G4nCNGkQ09
 reVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ0TJI8hNQHFSciwswnkKYs6H6YOxN0mJlTONsFkblZ5keMAAXbu3OGqjJC2l9WyENXimmNzvpSkc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7HJFdi0sEO36Ni28TTN7VyeswNZAaagDvvbxKz2uJD69bTxol
 NGNCeOMgUTqpLujY304l8zBkLJb83CYpsvBJDDQgkzArPPx9gPCnmJ6zCqp6hEF14O1k7k52IO7
 tQ06EYkGeJADxYhMOOtwX1vYyxoNtzzAse1ENKHQVExRFE1tAoCV+cJiRKiI4tm7hvIaMbE0=
X-Gm-Gg: ASbGncs98itjExWsMAfKL/n3CfaOfayU4iqmQjMuPpTbDB8ukowaXBs20FnUyxmDzhH
 faa7u5d9sMILxTLgixPxjL7gXVs97ekjyl7u25QMAyFgMt+5Kz4saMWnoUTvu1tn0XBWSCn5nF3
 ieapSwuTRPrnLJNfJrk6JG7bjsRGrphuIX2MC+UZoQnfX2XJPojpipGZWFG/Anu6qgH+zMVykE7
 VQ+nKQpFQoxxgQvJT+7ahjL4FQy0UXhaqyYpZa+dw+YLy6miAmt5KtVPFDP26CAAxpruGtk83Hv
 u02cT4jGjLllsH1OQtoKCVGhQt2+mXI0p0Z5xdYfR1KRQzqPgu5bUsnXkgZnmpZRFFUqrQd5TF9
 BH70lllMgzS6g5J37y2kVoQ9ZkgLLNqFtP2XA9NVMYAHOlYvqHeQVdE07tcNoLlFmyntnBNfAOp
 dfi+b94Ob7m/Kg
X-Received: by 2002:a05:622a:4c8:b0:4e8:ada0:450a with SMTP id
 d75a77b69052e-4e8ada0a00cmr197923921cf.45.1761221775004; 
 Thu, 23 Oct 2025 05:16:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeUhuoseObWTvRgOs3Xxp4Tq849T+csVGpql5BFGo9n/VmAM+rZHain9nu6/6zo++Onjyw+A==
X-Received: by 2002:a05:622a:4c8:b0:4e8:ada0:450a with SMTP id
 d75a77b69052e-4e8ada0a00cmr197923451cf.45.1761221774525; 
 Thu, 23 Oct 2025 05:16:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378d67db627sm4204351fa.39.2025.10.23.05.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:16:13 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:16:11 +0300
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
Subject: Re: [PATCH 11/12] dt-bindings: display/msm: dsi-controller-main: Add
 Kaanapali
Message-ID: <binhwh2sb72ipt2qhqdmnid2hygdnjx62mhzn2cl4v2do467gz@wkmsvroshkcu>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-6-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023080609.1212-6-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-GUID: DY5hdwcspUdJYb5OwZoZ7RLNWTWaxKe5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX98pwww/cs2lX
 6F2y/urp4Edx4+pDYVXBg28bqEWcVx+4j5pfKkexng+zZQ7v6dIYzxXAabmq91s5lgfxNfB/o8x
 AMMArTBoXmCHeAdaWT7sZC9GisXohw6aI2E8skYz51Ma1el1szTcgoMA2k4uMdwXxSDRHO/o2Fz
 mK5nhN/jROQTdxX44G4bURMWQT92rMGxNOLz9UOwK3pkYwri8UaFS+dx5XGM1ku/jc+7C8+8POY
 hTyPZ5OgZJusgT6CWB9vnsTFDoK7SPtbCzLLB1zXTLHysX8NM+cTl8/y+rTJsUjIcrN35S03Ly5
 mmvcYo7D4mwpVsWoriVMm3fSNjCkOrAAyaxgqfCte2i17h1kb9dZQ1zAL5J3qEMLMdUmqVQVI/3
 n8krkmSprg/Ta3iIh2ARWw6GvvFEtw==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68fa1c90 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=yQNLmfnzQBnRYO31l0cA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: DY5hdwcspUdJYb5OwZoZ7RLNWTWaxKe5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031
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

On Thu, Oct 23, 2025 at 04:06:08PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add DSI Controller for Kaanapali.

Please say something more important here. Why do we need new compatible
for this platform, etc.

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 4400d4cce072..536ebf331828 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -15,6 +15,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,apq8064-dsi-ctrl
> +              - qcom,kaanapali-dsi-ctrl
>                - qcom,msm8226-dsi-ctrl
>                - qcom,msm8916-dsi-ctrl
>                - qcom,msm8953-dsi-ctrl
> @@ -369,6 +370,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,kaanapali-dsi-ctrl
>                - qcom,sm8750-dsi-ctrl
>      then:
>        properties:
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
