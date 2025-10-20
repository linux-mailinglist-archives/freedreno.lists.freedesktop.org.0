Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E334EBF0BB7
	for <lists+freedreno@lfdr.de>; Mon, 20 Oct 2025 13:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCED10E417;
	Mon, 20 Oct 2025 11:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vupo0rDt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10CC10E28B
 for <freedreno@lists.freedesktop.org>; Mon, 20 Oct 2025 11:07:41 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JMs0W8012725
 for <freedreno@lists.freedesktop.org>; Mon, 20 Oct 2025 11:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/3XkzzDE6pgtYDQvU/LrOrAk
 KN7CmI67gQk/krP8dF4=; b=Vupo0rDtbyDoiFdRGKzMaEGFKfc1VVYpV9RhBmPS
 Gfb7yYNwj4W5B3n1gmSPHGUvUiwwTKp6gyv6bspCvIOVp1v/4M2U2XLpLMw6kOyD
 bs4+qBuWetGShrObreU4js9zBzZQVBAK3pXnen0ixgasx1NcXn9GilhkGnXfInDO
 m3vhbsDtY4LiJvltorVDNJYBX+Uk08stgGohU474ZscwgOH49IW4vhcvBnwDlDFb
 YicVkdY7Y2rr4IbTx/FI5t2zlqTKTY7axzik95mhS3CaIp/cjxgxFyC6UErImv/f
 FIvjeZAqjXH1fykxj59SFrwGE3u4jTzSeYkbWQIIfr9vxw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3984fg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 20 Oct 2025 11:07:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-892637a3736so956774585a.1
 for <freedreno@lists.freedesktop.org>; Mon, 20 Oct 2025 04:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760958460; x=1761563260;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/3XkzzDE6pgtYDQvU/LrOrAkKN7CmI67gQk/krP8dF4=;
 b=vUJHpfZnnNJq+BHltiIY5gJyDM7uSaPkBYlR821Pgl+6JR+LsaoL+pRdJXJ1uHyf/a
 dv0LmcV0a85hK7CrReCJrUKuD0H31fo7X6dSa89/BGuRFHtfZHZTBMvZzcBexG7QRxHK
 LTMuACQFfX3SCld/2cGryQW2Tth387aMv6wMxTrJsLetBto3WUX6E7xG7EHcmg/Bu7WC
 4JPOsQtQrIbPAhMa1uIhVlTO6w1Z3I3uanrljpmK9ItY3pQcaMAxke9yKyHvy2jXpSWV
 IVMQgDw4psLoYCipUA98Z3XAf7Qj12OyKZ/zUEb1Ng/YxgCP/hF02Z8kUdejpholnEXE
 Aiiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/OHps8IMREVC2POo5bJDe17RwB7CHNvCAnKFR6EFqjGbfTGTMrsQ9erz50jYh++ui6Z6t9E5+rAE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwM+fbqnn/jVIM7lUNpbJ00oInf3nYN421iIq57hyHP/akitCUn
 /kGulxOZCrnAZA6A2uJVloY/n2gaOFvVEW3BTjT6pjXasL36W9RCvCO4AWPUaTl3nMV7KQu+OAO
 1Ye+S/LMlmMeJAlFmoZQt0h3L/ViS4MKQi9nBbadDBfPY1qDs2sQo5VvacAUdP7twbV2JnyU=
X-Gm-Gg: ASbGnct82VzUiAmddDxdmjCPBTIsROw/yc0BSGloacIJKEmwpbj11umjOCbEaWbK05o
 lPtkIRTLPDhulEqKymOKHmX4R0fxUuSoYljJ8xj78q+upwoB2rRHYEzASDW4KEWnBVFMSzRH+rH
 z7D+TQj0XTb97ZRkpGvckS1q/Ok8i0oWTu6MTjTvSa5F6PRXx6asMIqi1uEz5lu6jT+DA9oCNgX
 sGuKCxDa03SK95Q+gQigBCSIo299yYYZMsxW8g4vuyRA+BxmDgvdUgNLrZkng2MEFydJG1a7Rw/
 x1uGDYcmApedzScDM3ZaoLwz/33FE0TqLogEt1MrHtX1ERu+3Zv4UqFLZsG5sV5FH/0i8/ZjumU
 BuCL8X/JOppWVpoplw/jChwCYncaq/UFB6nhFTWiAPcHO/qwOrwIj9x1qXvKKodomk6pOYUqs1m
 /XQFilz8JYjww=
X-Received: by 2002:a05:622a:1812:b0:4e8:9402:a809 with SMTP id
 d75a77b69052e-4e89d263d69mr149386751cf.31.1760958459658; 
 Mon, 20 Oct 2025 04:07:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEukabNO0W4DISkBvNcRhiWR3IUYfG3P7NB/i98qxN5u2LvB8QcV9XfUoEO0smvsXnJpaPJ+g==
X-Received: by 2002:a05:622a:1812:b0:4e8:9402:a809 with SMTP id
 d75a77b69052e-4e89d263d69mr149386231cf.31.1760958459184; 
 Mon, 20 Oct 2025 04:07:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591deec3856sm2410747e87.50.2025.10.20.04.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 04:07:38 -0700 (PDT)
Date: Mon, 20 Oct 2025 14:07:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: xiangxu.yin@oss.qualcomm.com, Rob Clark <robin.clark@oss.qualcomm.com>,
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
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH v4 1/3] dt-bindings: display/msm: Add SM6150 DisplayPort
 controller
Message-ID: <f4dihh4z2nnkjcpsrmopycm6opellvv4mkpee72xjbn26nw544@sfc4oy6c2xci>
References: <20251015-add-displayport-support-to-qcs615-devicetree-v4-0-aa2cb8470e9d@oss.qualcomm.com>
 <20251015-add-displayport-support-to-qcs615-devicetree-v4-1-aa2cb8470e9d@oss.qualcomm.com>
 <58446b2d-560f-4a7e-890a-78ae0bb92908@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58446b2d-560f-4a7e-890a-78ae0bb92908@kernel.org>
X-Authority-Analysis: v=2.4 cv=KcvfcAYD c=1 sm=1 tr=0 ts=68f617fc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=3eJD8ZQ_GueHMKJvpIsA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNSBTYWx0ZWRfX9Stbbjhf7L0T
 SM+JPmzSWkAQdn+/rUmUPh3du7Xa9Mmrl+kZbmSXj6WSHK6TDeLlq/PwA4aVW8BIRRrWR15+PLh
 Z6fPp7F9bebz5/ywHZBUvpLulCb9lLvKW+/2RHtxnm/LeU+Ua3ztypqIe+gnL7d9ut12uZgqhin
 39yjm15Nl4M7jRSiL9x0lyzj+mCyZ1bd9AFedNIThWbcKELRrhrNb52/e5hOnDUGt+e9KYsrM1c
 DZRT8LZZUkV0rxTC6FCGPPH3EPaeuqoYwlRb/RSKnMLEbFQd1UA5AFAzvkMuAkAsaEOxKugjAsl
 c0+VdiatwpcRSJSttDJMjOhzusv9KCzFIuxnqLuf/9vxMpuL5Oxt4uo+Ju32h8trgDpblp+ATOH
 1hPhFgSYWOsMkB8i3ogfESYBOhkBgw==
X-Proofpoint-GUID: pjHfegokeDifrdmCg_oDVGZihOA03IC2
X-Proofpoint-ORIG-GUID: pjHfegokeDifrdmCg_oDVGZihOA03IC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180025
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

On Sun, Oct 19, 2025 at 07:13:32PM +0200, Krzysztof Kozlowski wrote:
> On 15/10/2025 03:53, Xiangxu Yin via B4 Relay wrote:
> > From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> > 
> > Describe the DisplayPort controller for Qualcomm SM6150 SoC.
> > 
> > Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml     | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> > index 9ac24f99d3ada1c197c9654dc9babebccae972ed..935eca23ce6b30b81b3ad778e5fcacc817a230c3 100644
> > --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> > @@ -51,6 +51,16 @@ patternProperties:
> >        compatible:
> >          const: qcom,sm6150-dpu
> >  
> > +  "^displayport-controller@[0-9a-f]+$":
> > +    type: object
> > +    additionalProperties: true
> > +    properties:
> > +      compatible:
> > +        items:
> > +          - const: qcom,sm6150-dp
> > +          - const: qcom,sm8150-dp
> 
> 6150 is compatible with 8150 or 8350? I have doubts.

SM6150 has the same DP controller as SM8150. SM8150 is compatible with
SM8350.

> 
> > +          - const: qcom,sm8350-dp
> > +
> >    "^dsi@[0-9a-f]+$":
> >      type: object
> >      additionalProperties: true
> > @@ -132,6 +142,7 @@ examples:
> >                  port@0 {
> >                    reg = <0>;
> >                    dpu_intf0_out: endpoint {
> > +                      remote-endpoint = <&mdss_dp0_in>;
> 
> Mention reason for doing this in the commit msg.
> 
> Also, messed up indentation.
> 
> >                    };
> >                  };
> >  
> > 
> 
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
