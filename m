Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73766B3157C
	for <lists+freedreno@lfdr.de>; Fri, 22 Aug 2025 12:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3901910EAB4;
	Fri, 22 Aug 2025 10:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gt/OZnn/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E4810EAB4
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 10:34:23 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UINJ017888
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 10:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=FCN29/vu9A8ZXeY7sbANGhL8
 9+mqcLMKMMaamyrrvVE=; b=gt/OZnn/0rBmO1nh/YzOEqEAqD+OdbivSHQjcNbg
 fXxRGhJ6kz421MT4w3aJZOSc4sU1S9Ij4AA52jYAXkHJlp0p+Mbm6XIqBIfESINZ
 wztcp9eUlKvRb4wBoAl5wR/KLFXf1y8j1JzT0zym3dNIZVI7SMAwsH9ISwai6Lwg
 0IetRzTPGmq9TgoslbFMYQ5rWmkwZ24MyyYVHyuUQf+YojVeu5ZOSuOVyjOm9SRb
 lD6MUqM0T8BE+MR2kjIRtOdTs2VnaBeyZwG8hPcHo/tT/kERftofHKa2oWJiKVi1
 uYyQ9FUElk3KZZCHXPLuIkgNn4m+J9s4X1FbQEERhnzwlw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52b0rq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 10:34:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b29cdc7417so45510971cf.0
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 03:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755858862; x=1756463662;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FCN29/vu9A8ZXeY7sbANGhL89+mqcLMKMMaamyrrvVE=;
 b=W05VT5AEcFTSoR6D4qiCpyxvxySomuMcJY+tOK/aklE20Jy9ZGoAusagkbdIJWLm6r
 AW9R94BnPmFXT6nDnDIzpqjKkrACicO7NK2uO9GDHUxl0Mg17CFiHQS+0ymdXlLkszdK
 xK9nnjuz9T9AZ2UrJZx8Ba9m4IX8H/c2A9+dHTYu4r8EaJlU8efx2stIAfiBpnD8S10H
 yOPzYUBU0WWrtAFwZynva4aJ7O5GR/e808ohsvhhVHlyoCcHFSb/RhzIsuzPrsR9FsxS
 WXju4Vee3Oa1f4lirOxPOnWFMmTuumL8BeuM5pyrUGs8D70/SGw+Vzt207vovyeCem1+
 UuSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCULs1eKzczoZ/qSOXeaYaOROZMw+YcGW68c9PpkUEYoyb7PNYEgdExiK1oNFMwx5UHwSLdidUaw/CI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGIw0HltxG6F6xzS4AGn2kh6TaF4AzJxNkudWpC5aEKYQ7TlCl
 yT86g1I8hAWqO4exzbUi1ji5JRYTzjsl0KLoIS8h/IjqiJr/nxzBpvSoMBMKk93rx+I5idQHrgb
 5ep7Xb4iS37iRoKXLrTd6/cgGG/Sa7b3Cx1c0nNiodz1fyEoJtpdBb1Oe0U4df5lIGJeFnGo=
X-Gm-Gg: ASbGncutgrNeJDexl1XZEdl/prIwzebFVuMVZ9sAMXunyL505+bXntKSEGvvlfq4QfQ
 li7vLCGtf5QzgQwwWeXomqFKJsQHYvJjTzUcyKHnIkcTAGwdVi2IoYFkxwjQbkp9RWq7K7BFycs
 +4+O8caTz0bI6wiDireOxy/uUNjicQ1JOde8k0iQ8trBuyU/ob4q4yf4aunBVZEKByLTER6eQqg
 SXL05kpkjMUGjhgG5tXBFB1mdAgJhEbLO/oacgZUAfyRRuV6duokvhCuTHX412Gpy2+YAzzjfPY
 vmAZSd6pIcDYwpstf1KVb2TPpHL6C82WKYrTyr8ec5XPjgZlihzAq/UuqG+4Tod4SsZbx+v1h1m
 SPfpqX568JmHYn5MayPgfGVkY0lX5oFT9eqJplhUFRRbv9c5jIxDT
X-Received: by 2002:ac8:5701:0:b0:4b0:8ab3:2c7f with SMTP id
 d75a77b69052e-4b2aaa05e76mr25339381cf.11.1755858862193; 
 Fri, 22 Aug 2025 03:34:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPnOrDbKicPm/yuh68OGc5jaYkOPRZ2c1JmpVxuzfF/z2tQgKp4Rzhw5PzXzW4Jrhl8KQDlQ==
X-Received: by 2002:ac8:5701:0:b0:4b0:8ab3:2c7f with SMTP id
 d75a77b69052e-4b2aaa05e76mr25339071cf.11.1755858861488; 
 Fri, 22 Aug 2025 03:34:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef43448csm3436848e87.147.2025.08.22.03.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 03:34:20 -0700 (PDT)
Date: Fri, 22 Aug 2025 13:34:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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
Subject: Re: [PATCH v8 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Message-ID: <ftazymlvq7rtbesx4keuek4avmmjq5cx4clewwpmem6ta7qmti@bn24prgszc2j>
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
 <20250821-qcs8300_mdss-v8-2-e9be853938f9@oss.qualcomm.com>
 <3ws6xfmmrnjybn4umbbnzjdksqberzuxslz6uxpabtsz2yzyss@jwblshilyx4p>
 <b86a1759-e49f-48b1-833d-fdc37b450f5e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b86a1759-e49f-48b1-833d-fdc37b450f5e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXxILBeZaGN628
 CWK86CEJdoBKsdOM0jZjDE1O496Bor35pm2vWrS/HzHqrXm97zp2ZkD+7JFqKqFZm0nE9B9PuhX
 VBVNnVPg5fRWMkVN0zwxXJiWCVzB2A6Hzh39C8gJv32Eh8vr/Dx3BKDgeaf55p4O4Jj4N2GCvbM
 k9QHih4VpXPXjOFNAMbPUqu/U3UUPXUaXR6fNj6HYNFtZSY0A2yN3mbziZ/nzBcwGQIzRqUbImq
 IgIQhL1teZMBYcC5UHnXZwQjUunxVmyjCALFtBWODA03YGnKqL8lp12R+up/bqZ207fzwrdnf4k
 0b+jpa96Vwq29RBeGSHFfmgnencol++Up8wtOXZBvzaEujhdX3bkkbTkG+Wjhk5yPq+VPCK5Sel
 9hR5eot+eEiqm8Mtg8FfSTACjewS3g==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a847af cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=mnVnZ1ScStkaolgTZ_IA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: tKHa6SGS0zIyoPXz4JfUF5hsKBfGKRlM
X-Proofpoint-GUID: tKHa6SGS0zIyoPXz4JfUF5hsKBfGKRlM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Fri, Aug 22, 2025 at 11:06:58AM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/8/21 18:28, Dmitry Baryshkov wrote:
> > On Thu, Aug 21, 2025 at 11:35:57AM +0800, Yongxing Mou wrote:
> > > Add compatible string for the DisplayPort controller found on the
> > > Qualcomm QCS8300 SoC.
> > > 
> > > The Qualcomm QCS8300 platform comes with one DisplayPort controller
> > > with same base offset as SM8650. It requires new compatible string
> > > because QCS8300 controller supports 4 MST streams. And 4 MST streams
> > > support will be enabled as part of MST feature support. Currently, using
> > > SM8650 data structure to enable SST on QCS8300 in the driver.
> > 
> > Bindings describe the hardware. There is no point in discussing the
> > driver here.
> > 
> Thanks for point it.. "The Qualcomm QCS8300 platform comes with one
> DisplayPort controller that supports 4 MST streams", do you think this
> description will more appropriate?, only discusses the DP controller, not
> referencing the driver or SM8650..

Yes

> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 ++++-
> > >   1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..ac44abfdd2853393ae199387c9ae2c37e1c48f52 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > @@ -18,6 +18,7 @@ properties:
> > >     compatible:
> > >       oneOf:
> > >         - enum:
> > > +          - qcom,qcs8300-dp
> > >             - qcom,sa8775p-dp
> > >             - qcom,sc7180-dp
> > >             - qcom,sc7280-dp
> > > @@ -179,6 +180,7 @@ allOf:
> > >             compatible:
> > >               contains:
> > >                 enum:
> > > +                - qcom,qcs8300-dp
> > >                   - qcom,sa8775p-dp
> > >                   - qcom,x1e80100-dp
> > >         then:
> > > @@ -217,8 +219,9 @@ allOf:
> > >             compatible:
> > >               contains:
> > >                 enum:
> > > -                # some of SA8775P DP controllers support 4 streams MST,
> > > +                # SA8775P DP0 and QCS8300 DP controllers support 4 streams MST,
> > >                   # others just 2 streams MST
> > 
> > QCS8300 has only one DP. As such, it doesn't belong to this clause.
> > 
> Emm,thanks, i got this point. So here need add another clause only work for
> QCS8300(one DP controller with 4 streams), and i put codes before
> "# Default to 2 streams MST", is this the correct place?
> 
> -          # Default to 2 streams MST
> -          properties:
> -            clocks:
> -              minItems: 6
> -              maxItems: 6
> +          if:
> +            properties:
> +              compatible:
> +                contains:
> +                  enum:
> +                    # QCS8300 only have one DP controllers support 4

typo, controller.

> streams
> +                    # MST, no second DP controller.
> +                    -qcom,qcs8300-dp

Missing whitespace, drop the "second DP controller" phrase.

> +          then:
> +            properties:
> +              clocks:
> +                minItems: 8
> +                maxItems: 8
> +          else:
> +            # Default to 2 streams MST
> +            properties:
> +              clocks:
> +                minItems: 6
> +                maxItems: 6
> > > +                - qcom,qcs8300-dp
> > >                   - qcom,sa8775p-dp
> > >         then:
> > >           properties:
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
