Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A26B59560
	for <lists+freedreno@lfdr.de>; Tue, 16 Sep 2025 13:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218E910E78A;
	Tue, 16 Sep 2025 11:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+aYzdaW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C1C10E77E
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 11:37:24 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G9vCcu020364
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 11:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dxuG3uBlvh++1t244lhPvOvJ9hQr+cTrRHwr2AleVfc=; b=R+aYzdaWE7qzBzkZ
 3r8dVPKPTpL4moVEc6HwWBv+qSrCNTLvNl35lEKrn4LUghk4F4fzy1PjdnTK8bda
 JeUCewIXSOp536KIXjizho3QyHA+2pkQLBkXUfiFK/kc2u4hwGfgj+sHV5crylVN
 yMpub9dvQ7B8Ag4DRg7j7LwqiYcD+gf8d42lYs1WKnSdRWaAAay0wq9Jh9tD2GLz
 IRBxuf3ptYHZc+ZjtYO51t5H3L6e5WTqYPg6SNhN39/Ht4sNWMzc8COFC3tjZh3L
 ASai/UdeM6K+dhaBPWT16P5Z7ip1DXt1ZbWyOTb7ze3moEwyMtpaIg16pc+8Su3M
 iH7R0w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496h1sm70t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 11:37:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-78de70c9145so3524036d6.2
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 04:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758022643; x=1758627443;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dxuG3uBlvh++1t244lhPvOvJ9hQr+cTrRHwr2AleVfc=;
 b=c8IRpzk8KHR7bMioMLtURJ2Z7rM9KjULUj3TuK5PZpdXTSTbAoBcL1OmKZ2CR8z5op
 MRT15AMdcE6HZKdGM3EXpM8+1z9rVzfcoURaZpEpkxE68oodQqtO8Zn++8kBVJeKzVr3
 lrQTl1wdIlGt/tsjRxUa9RoX6nlIXJOkjwPBbTSd5GVVmpaK8ziUq8164YHUIFJYRhbe
 Fuh7m78sn9orGy44NV3Y0D3RE7+I6fvLCAwic8Nq2Sk6LRYxlI45EsUiZJSzIxCWA3Qm
 lKwrpeZ2Rk3DISlHD9t6UYubsl8eL+GxqC85GizapjrwrcrfIalS0gjSXRNHvgqMMv3z
 QbLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnEMQ42autozZJn6zGpvkLmFj2EsfH+6AGMxuUCdmkVCSLQbFai2bNcrdXgA32rmi8Y0e7y51cH0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFI4sHpZgWkEd0D3VYgw1Tg7s6ajqD5ie6U4lSqK4qUPn1nJKF
 VoEiAD0bKUFD73DweLF0BTID+PM2OUwJxlWdhnCyP255TdmKkvDByymwcMgJYWEQ39AOcb8O0ab
 Thv+pQ9mPQkE7FcSvvzZ/3KbX1paNR8O/8ejqupn6aShkiSUnR9vQNwmzk0RzBaK9n0aSHno=
X-Gm-Gg: ASbGnctdhHnS0iUH7Kebb9fNQJEB7TAJiDsz6iX+Hg8wl7R5y3rfy7IgJ3y78/Mvicf
 k7OURpqbA8rapFn/gAcJUArZCZdZzIUlJMlkbMkqG9n9NqwsG575Tvt0bRXUHeghYKPsgjNIMnw
 l+1dYjsy17nHTHxglLnfOx47BmhCWOZsNc8i3v90m++SjrVCFibO7wMLat8TQB0nyPzppMFicEO
 1Tv8pFBpVsFDT2FozmSqDHPCM82XMDEZzMGlsWknJPgJIyuEkg/E6dJoOOsJ21RRc5lzlo1SWxw
 YIp+/NDt/h1nc3zRrDxFZ3H1hq6IxP65qaRu+OkMZmmDmwm6tIMjnUjac1WcbiE0zEZ3vXj3zd+
 rbBblYlG/cKOR4gSXh/uxyjuHWM0Uryc/bX8NVFHSh1arX4jgENTg
X-Received: by 2002:ad4:5ded:0:b0:72b:5e4d:d41e with SMTP id
 6a1803df08f44-767c69580d5mr201008066d6.60.1758022642180; 
 Tue, 16 Sep 2025 04:37:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxRVjbeGA3MMhK0y7Gk1lUdDnWFrfIP3SLf3A/hUrKPUgKEZcoUaquPXGhgx/yv9i67CvOTA==
X-Received: by 2002:ad4:5ded:0:b0:72b:5e4d:d41e with SMTP id
 6a1803df08f44-767c69580d5mr201007116d6.60.1758022640778; 
 Tue, 16 Sep 2025 04:37:20 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5cf300b7sm4379319e87.45.2025.09.16.04.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 04:37:19 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:37:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH v2] dt-bindings: display/msm: dp-controller: Add SM6150
Message-ID: <qnsxykukg3kigfiihdrrjkp6sbm4qte6lsga3as7eg3xaodtlt@skg5tcp4htii>
References: <20250916-add-dp-controller-support-for-sm6150-v2-1-e466da9bb77d@oss.qualcomm.com>
 <5sg43rsun33i6bm3vz7io7yx2p4m7bmk5bnrnjg6u3zrulyofs@gyxtnfs4gvhz>
 <d302e71f-19bb-426f-a7df-c0d7854e97af@oss.qualcomm.com>
 <67a06487-001a-4af7-83cd-e9d05d848479@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67a06487-001a-4af7-83cd-e9d05d848479@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: hgmVdrvVO-mx9X7XGZGCq_-47e7HV8V-
X-Authority-Analysis: v=2.4 cv=A/1sP7WG c=1 sm=1 tr=0 ts=68c94bf3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Cl27WJnY82uGaOAjgZAA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: hgmVdrvVO-mx9X7XGZGCq_-47e7HV8V-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA5OCBTYWx0ZWRfX33Y5mQUpWLhD
 x/gtQfSGVzTvIf1AAue2HRDz5php+hsX3Fhg0gjPltWAsU63PNuMcE0lGqJkdD7XQATyqctZ6S2
 AzeDbX5FbbzmObjV2fXlBaWvkE4NHTp2rklcYUtgeNLM/79Ko+LOqlLacd/yZmlJbQ/OfYMdzL8
 GlsEZCf+82poErp2jN7An9KYBBvu/ZlDxrjEW290TM5ej12dbQl4OT2KV83/68PRw8yZX/nq+xi
 UVz2e2gpAjEEydH6luhurAalHqW8NyGoJ3/dkuk+/HNwkLLq8ANGnX2sfWCYT/8r7XGjzyg8LZr
 lwbouRdam/CI7qdPFjErBi+ZMirqYIYJU3ntdjwf3OS4Ck+S/BYHQGHXtuO4kbanpvdTf+UVpUW
 VgEukZqw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150098
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

On Tue, Sep 16, 2025 at 07:34:52PM +0800, Xiangxu Yin wrote:
> 
> On 9/16/2025 7:25 PM, Xiangxu Yin wrote:
> > On 9/16/2025 6:22 PM, Dmitry Baryshkov wrote:
> >> On Tue, Sep 16, 2025 at 03:31:35PM +0800, Xiangxu Yin wrote:
> >>> Add DisplayPort controller binding for Qualcomm SM6150 SoC.
> >>> 'qcom,sm6150-dp' uses the same controller IP as 'qcom,sm8150-dp'.
> >>> Declare 'qcom,sm6150-dp' as a fallback compatible to 'qcom-sm8350-dp'
> >>> for consistency with existing bindings and to ensure correct matching and
> >>> future clarity.
> >>>
> >>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >>> ---
> >>> This series splits the SM6150 dp-controller definition from the
> >>> '[v3] Add DisplayPort support for QCS615 platform' series and rebases
> >>> 'dt-bindings: msm/dp: Add support for 4 pixel streams'.
> >>>
> >>> The devicetree modification for DisplayPort on SM6150 will be provided
> >>> in a future patch.
> >>> ---
> >>> Changes in v2:
> >>> - Update commit message and binding with fallback configuration. [Dmitry]
> >>> - Drop driver patch since SM6150 is declared as a fallback to 'qcom-sm8350-dp'.
> >>> - Link to v1: https://lore.kernel.org/r/20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com
> >>> ---
> >>>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >>> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..82481519005a1b038a351aa358b9266239d0e8a9 100644
> >>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >>> @@ -46,6 +46,7 @@ properties:
> >>>        - items:
> >>>            - enum:
> >>>                - qcom,sar2130p-dp
> >>> +              - qcom,sm6150-dp
> >> In the review to the previos iteration I think I was a bit explicit:
> >> "qcom,sm6150-dp", "qcom,sm8150-dp", "qcom-sm8350-dp". You seemed to
> >> agree to it. Now you didn't implemet that. Why?
> >
> > Sorry, I misunderstood your previous comment.
> > I thought the recommendation was only about the commit message, not the
> > binding structure.
> >
> > Does the current implementation mean that qcom,sm6150-dp and qcom,sm8150-dp
> > fallback to "qcom,sm8350-dp"?
> >     - items:
> >         - enum:
> >             - qcom,sar2130p-dp
> >             - qcom,sm6150-dp
> >             - qcom,sm7150-dp
> >             - qcom,sm8150-dp
> >             - qcom,sm8250-dp
> >             - qcom,sm8450-dp
> >             - qcom,sm8550-dp
> >         - const: qcom,sm8350-dp
> >
> > Do you mean modifying it as below?
> >     - items:
> >         - enum:
> >             - qcom,sar2130p-dp
> >             - qcom,sm6150-dp
> >             - qcom,sm7150-dp
> >             - qcom,sm8250-dp
> >             - qcom,sm8450-dp
> >             - qcom,sm8550-dp
> >         - const: qcom,sm8150-dp
> >         - const: qcom,sm8350-dp
> >
> 
> Or this?
> 
>     - items:
>         - enum:
>             - qcom,sm6150-dp
>         - const: qcom,sm8150-dp
>         - const: qcom,sm8350-dp


Yes

> 
> 
> >>>                - qcom,sm7150-dp
> >>>                - qcom,sm8150-dp
> >>>                - qcom,sm8250-dp
> >>>
> >>> ---
> >>> base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
> >>> change-id: 20250916-add-dp-controller-support-for-sm6150-525ac2ed8c86
> >>>
> >>> Best regards,
> >>> -- 
> >>> Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >>>

-- 
With best wishes
Dmitry
