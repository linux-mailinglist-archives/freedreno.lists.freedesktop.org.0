Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40EDB4896F
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 12:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A83610E125;
	Mon,  8 Sep 2025 10:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jti3dHSM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6778610E085
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 10:04:13 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5886fGZI004649
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 10:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TUCQQaCIPPEbbTPsTsrcgsfo9TDR5bbHwDO1+w8BQ9A=; b=jti3dHSMhzULG8Nj
 wCZiRdihhFxxIy1SsTTyx3LzZWw6KjQuj3M3tFnG8aDGyKq3AHH+NgAOANyq02fR
 UfdzzQ1TRTMpkmBRr4bZN49OgiZGjiR02V4fZdFV1DjwlGgJ1PCSgNjJQc7PUhFI
 mVLIfyLvBdNzamnMEdjBeyNrK9lLW72r4mYaSptG53R3QQ60V2FnMQZI8RpYjZ1l
 BLpLrIY1oUN2SnS0NpOrcGX2kbk+N2ptO3YW9E/5ppy0hhdaJJ3rwfbH+c7IEuJq
 nKG6q+R3BRfAgP3YE4dJtmpRq63HxzG9exP+3c8Y3TJK0PiyBzxI+17Lce6ndUrB
 PzZacg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37rnru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 10:04:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-71ffd145fa9so127778316d6.2
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 03:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757325851; x=1757930651;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TUCQQaCIPPEbbTPsTsrcgsfo9TDR5bbHwDO1+w8BQ9A=;
 b=PinLsF+dEjs2W2ZQ8r06VDv2fmAjw3SkhuECg/n+UMN5I8H5tikR4GcSMtROzyimt5
 ApgWST+4WB2HLdzdAFEkMgtcJU/xw2P8KgP7i7YwySSvVs/h+8czH/DzEReFvwbNez15
 9FfQTw7v7OlKflKdicaZ2QjLzLPzkf3gH9nACN/abbotuG+M5nazTWfNo0Ske2bVE9zn
 URC1HYKnUyEI1RzhVy2K0n5sYVX7tuD4gXA0oleVbkZjECVI3Onb02t/vpAdFqi10RAL
 bh+6zsX47DlUsVKmwG/E0sbWHI2YxaKto1lIMeNrMPy6vDMzAtr1c6ZZ+29NK2vZ0c9y
 IT8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVozR5I2BF5MyDJSvJ2MP7jMY9Ha/JRbC6lMPGS/8BxucqUEF/yTMw3UqMMEWhURQ+oDvY3PQrIXSc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7lPKi3FU/iCCebcTpGtMuvm7YM0t0wB1UpfAT9HIgalgw9U2Q
 vQLDCYcoSFlhl11+0V/EWuqlj2yvwnDFQNw86CsvlMFeW0OKzRONRjDdjRzm4Ii9tPDeXO6HsNL
 /SCglexMGjQTvYT+AIzPXdBMLAAWSB1CIp7ot+ppIag+btj6P74NVG/7AzpCNmKFi2BcLdL0=
X-Gm-Gg: ASbGncuHaaXDk5X/s9knyxnhsNZz/xce9fOfndvqAIQ4ICD+6nGtmaqgL0+4BIh6laN
 G/WmoUlKpAF4FeItzBoWALXUizljNV67KCWqYK9oHoyuS1NTs3HJyrJ7/Wt1wAE6gzXJjNpXOJ5
 nJ7kT9CyS7gAwlIzyGNvBaqKqxvfPhlMKqQMdY/BDfD470WgtEa2ACPJfNeXVEkrrWZx9b4T76d
 Y2wy1raROGV/wG95Sovo8jMSpF98+tz2+hd1vSOBWAn0kdiO98iJDxp5RWkZffdJA+PYA9akp4/
 O1IYZPLlJ4+AmiRGQqGnvDuvcAHTvNnF3gCRVQbx7JkDbSiL8JD9fYgPZEbocia8Y0owtHnuzil
 x40+t+d5U8GP7JnPKg9UdqN83+fo9Dl0ILRBJXjAWASJg13qr9/8Q
X-Received: by 2002:a05:6214:c2e:b0:70f:a8e4:9de with SMTP id
 6a1803df08f44-739322f8babmr88180226d6.27.1757325851107; 
 Mon, 08 Sep 2025 03:04:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTM2Aa+Miz0K6s7xyeRR6TpR0YSRPsezwYwrqqCf24cX0g/PXlLkfxbUOlt6qGOF4asGVuOg==
X-Received: by 2002:a05:6214:c2e:b0:70f:a8e4:9de with SMTP id
 6a1803df08f44-739322f8babmr88179646d6.27.1757325850389; 
 Mon, 08 Sep 2025 03:04:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9cb5sm3498239e87.95.2025.09.08.03.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 03:04:09 -0700 (PDT)
Date: Mon, 8 Sep 2025 13:04:07 +0300
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
Subject: Re: [PATCH v11 2/6] dt-bindings: display/msm: dp-controller:
 document QCS8300 compatible
Message-ID: <pwbmqjspoyj2n7gchyaycxfp7ge46pyvm5dntkk7awkr6pblmi@wun2jdt5iehq>
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
 <20250904-qcs8300_mdss-v11-2-bc8761964d76@oss.qualcomm.com>
 <p2okyfwfl23bip65koaqezlvhyo3z47bnugojcieuspr37xc7b@s3qwgbqmts4l>
 <d8aaff46-9e3b-4b53-a690-351253753edd@oss.qualcomm.com>
 <jdbwncstextusng5boqg4v5r7krbnjts6f3zgd65cu4rrst7ay@kkod7ihbgfrp>
 <69219cdd-bcca-4673-9a81-084184fda6db@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69219cdd-bcca-4673-9a81-084184fda6db@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: t3IgQz6WfLc2cdvrDI0Ezl-gUxKmnPRS
X-Proofpoint-GUID: t3IgQz6WfLc2cdvrDI0Ezl-gUxKmnPRS
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68beaa1c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KvANTHea1ihHQiRrGRIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX4kVEPoEdwnFh
 sRyNNrz9lpKrq96AXITBpiaDYJXpFMfdQfS+Uwqely0VtxvB5Bn1t2tdYKcsRUAhS6u+7FYgcht
 UYXUzGbH4l2zobUEyzCKuGM0XFnvHOv2UF7OezlNeL+b+5GdN7n+eNjYgIO2fRF3c8mY20BnQzk
 UWYiydnhEIFjwGmfTekqb+dVYgnQIIkNod+HwimCSmJy0fvsaYQxvoyvMLFKf2tO2BPXmAK276n
 rF5IPljSK9zUo5v7Wv2DE19l/h6lwYOYvaIRL5IgH0loCIjOb3FNR8Qmsxw+rX0mNqULxbrgs5i
 2BUXjHV5W7b19mbS8m/Wjg1U648jvpqIE6ZBTGL7hT86qkYsD/P8D8XkDfC8CGN50J4Xu5GDt6v
 vwtDu9LV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066
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

On Mon, Sep 08, 2025 at 05:46:30PM +0800, Yongxing Mou wrote:
> 
> 
> On 9/5/2025 9:48 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 05, 2025 at 10:50:33AM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 9/4/2025 9:43 PM, Dmitry Baryshkov wrote:
> > > > On Thu, Sep 04, 2025 at 03:22:37PM +0800, Yongxing Mou wrote:
> > > > > Add compatible string for the DisplayPort controller found on the
> > > > > Qualcomm QCS8300 SoC.
> > > > > 
> > > > > The Qualcomm QCS8300 platform comes with one DisplayPort controller
> > > > > that supports 4 MST streams.
> > > > > 
> > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > ---
> > > > >    .../bindings/display/msm/dp-controller.yaml        | 22 ++++++++++++++++++++++
> > > > >    1 file changed, 22 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > > > index aeb4e4f36044a0ff1e78ad47b867e232b21df509..ad08fd11588c45698f7e63ecc3218a749fc8ca67 100644
> > > > > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > > > @@ -18,6 +18,7 @@ properties:
> > > > >      compatible:
> > > > >        oneOf:
> > > > >          - enum:
> > > > > +          - qcom,qcs8300-dp
> > > > 
> > > > Can we use fallback to qcom,sa8775p-dp instead of declaring a completely
> > > > new one?
> > > > 
> > > I think we can not use fallback to sa8775p, since we don't have DP1
> > > controller for QCS8300. SA8775P actually have 4 DP controllers (now only 2
> > > really used). So in the hardware, i think it is different with SA8775P and
> > > we need a new one.>>             - qcom,sa8775p-dp
> > 
> > The DP controller is the same as the one present on SA8775P.
> > 
> Yes, it is same.. I just want to confirm again—even if we only need DP0 for
> QCS8300, we can also use sa8775p as fallback, right?

What makes you think that we can't? Let me repharse the question: which
part of DP controller (single one) on QCS8300 is incompatible with the
DP controller on SA8775P?

> 
> static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>     { .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported
> = true },
>     { .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported
> = true },
>     { .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported
> = true },
>     { .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported
> = true },
>     {}
> };
> .mst_streams = 4 is suitable for both QCS8300 and SA8775P DP 0 here.
> 
> Previously, my understanding here was that we might need a new compatible
> for QCS8300.
> 
> Thanks~~>>>>              - qcom,sc7180-dp
> > > > >              - qcom,sc7280-dp
> > 
> 

-- 
With best wishes
Dmitry
