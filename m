Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E096AB39AC1
	for <lists+freedreno@lfdr.de>; Thu, 28 Aug 2025 12:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7900710E322;
	Thu, 28 Aug 2025 10:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ap71NfQ5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D0510E322
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 10:59:49 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S9J5I1004947
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 10:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=09leXTKVtloMTscnxlYkAl4E
 C4Rzi1g0wwL1WchT0Sk=; b=ap71NfQ5K5jUDAfi+bXDcK/qtsgDg/YT/SZQC3gA
 /KmdePO0gMNFf0DYCXDBlZ01Q4r3/BNnxqwvJVYQ+29iMRJxb/z/3gD+tHMF403f
 kUb6+RzXWlObGjItyKH0d5umGHD2g8dTHyWC290dsrpIBCd5JUlXIETQpIgy7ZmO
 1ZRlal1ZwMyQQfvteSoPx0Z3MiU/nNh5MtDR88tZlco9Z+VxSxgAvST3rlUNTDtP
 rqRVR59XSbo78R7HHHiV4FYczqvkJSjT9BD4UFdvuQWkDhHWrAVFNLZcMW/Kp/QP
 8JBjIcKbqL4ylLT+L2qZu8DNsfM+D6eJdurDhpTYcrkyhA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tbpghpxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 10:59:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70deedd1deaso16169896d6.0
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 03:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756378787; x=1756983587;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=09leXTKVtloMTscnxlYkAl4EC4Rzi1g0wwL1WchT0Sk=;
 b=jbW4BKR7lJu9tdhM/ZkItn/wR2yomk47jerqgaJ/ob0v1g5Xd27uCuISyIMR5g7fPn
 ioqOrHY1U0jYcT6Y7D5DF2WCADvRpo+xzJmQwNjDFhJ9V0ofVgJqxouLqL1ATNz6OI+k
 1qmZYHFBzEKHiP1yo80ITrSXzI+xguRwNnPf9RNOYEnC3xyv3aDylHwyL2VSPZV7gMcG
 lKYjJ57sHpbLonEyRmlJRfnWLDu/l3+gPpp/+MOTSKmW/ropOJBWbk+dAr+lAS5kfs+R
 VHTNtkZtV/gZ2kyy2oYXVA9iP2faap7PqupvYnxRPaD1q+w4Af4/LjJDfRGBh9TgUIPJ
 EgIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm4aSDCXRTIyrHjacGHL8FV+8Xavju+T7Q8HOxdfBAk/taKojS9Ga+pS40DKeCydvRBjbquPsuhGk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQ41jNVbthjQ6k5+yjDnh+qBQAm2N9VZnT8GsYsr4Uj8i+q/mu
 s9BjFjFgGQOFeQERhPgc9Y18S3TvQe45Dpu0ZYoQGqP9pHiHAmNQRZI7hFZ1H69kGEo0BYYdXXK
 fOVhr3PIBQ2lV7cFPdBY/IIjEI5zn0Wu657OSzz8d18yP/sqTUgnk5pUuzTVU8hC/GHsJUeE=
X-Gm-Gg: ASbGnctbmVE2AYvkeS/YB0AYcCTrACXhdKi8eLxSQbCe4sOxXV5eslXi7ctMU4R5VA+
 QoYB12I6YkWRHx/h7VpOBO8br7N2JnadKyIxxAFhu+GwqfbN2ehrahrVa6vkNpZwGZS+XuE2MGo
 95tbcgqOeLbtYQ5xXPUI4Q1rAGmDlmC7JCY1NGwF69OAl8b2dpLqP3BhCTOBCHJJDj20/+jYaXy
 U2JoHZUUoJoLxXAUZFeGyiz/U/rBfG5CW4nK4o6D0VnF0SnmYLAxxxpW9v2il/2lk5NhzWCS+ad
 r12+DyxKvFYl0fqfoWNecXRB9P6HevziisFeqcr25M0jE2lBSkBjjkThNiMmx/uSnqyNipCCfB7
 pKTkAtjct/rVIPsB3+113y9Y+D4z0KcMa86fYoKU+A45wDCJDACR2
X-Received: by 2002:a05:6214:765:b0:70d:dd5b:34bc with SMTP id
 6a1803df08f44-70ddd5b378bmr79863786d6.37.1756378787436; 
 Thu, 28 Aug 2025 03:59:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExFIterP9dImItBjYAqD1Xx4x9yddy09PGUubw4yf9+Su69Wqk2KWb9HrBNMXk2uDDsgEepg==
X-Received: by 2002:a05:6214:765:b0:70d:dd5b:34bc with SMTP id
 6a1803df08f44-70ddd5b378bmr79863606d6.37.1756378786978; 
 Thu, 28 Aug 2025 03:59:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e5aa917sm30826041fa.41.2025.08.28.03.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 03:59:45 -0700 (PDT)
Date: Thu, 28 Aug 2025 13:59:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
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
Subject: Re: [PATCH v9 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Message-ID: <vp4shoc6nok6byyrkq34772ag5axnfcugbr6jbdxglazvneurx@u7j36gjp5vna>
References: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
 <20250825-qcs8300_mdss-v9-2-ebda1de80ca0@oss.qualcomm.com>
 <20250828-kind-crocodile-of-progress-6cbbb0@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-kind-crocodile-of-progress-6cbbb0@kuoka>
X-Proofpoint-GUID: dTlLk8ry7AFoq_HdEWDtiDo0plj43Ndv
X-Proofpoint-ORIG-GUID: dTlLk8ry7AFoq_HdEWDtiDo0plj43Ndv
X-Authority-Analysis: v=2.4 cv=G7gcE8k5 c=1 sm=1 tr=0 ts=68b036a4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Rb9tGRSG334u1UeLp2EA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDE5OSBTYWx0ZWRfX85ZGuhiAsNko
 p1QDAF4jDfG6WFqxoeQt8CZLqmAMxZQ2G0qqsWH6fISutTnE9BxIQFT0seQ5VpOey2eltGHYfNC
 qmdA9R0VE5+nlczn1RAGM4OtXIqGbKTQe2PbwyBdcJB6nIIdRlZuBQLf4OoOe1qas0Nd45a2eI0
 WrH+XWudMgj3/d6ksXEZERabbztqnHKE9m+jVprKQSG4bT48cQu734Ogwcx80W6ProOMqrAwmB1
 fSRpmyVS29a76oTPYQIonxrQc5qTqonueRDwzSyJH1PJ9KhCtTcFy/7H55UprkYjLrdZTdQhjtm
 Lgr0BGw1y8OWX//5AIcxCN8nioTOEL+E4fNveyUpJ481lSoRy2AwCCkqB66yVO/XVVvbhOYmogg
 7Shv88jt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508270199
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

On Thu, Aug 28, 2025 at 09:36:24AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Aug 25, 2025 at 11:34:21AM +0800, Yongxing Mou wrote:
> > Add compatible string for the DisplayPort controller found on the
> > Qualcomm QCS8300 SoC.
> > 
> > The Qualcomm QCS8300 platform comes with one DisplayPort controller
> > that supports 4 MST streams.
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > ---
> >  .../bindings/display/msm/dp-controller.yaml        | 26 +++++++++++++++++-----
> >  1 file changed, 21 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..4da22a211442b7abe2dc18e769d8fd14d224eb40 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > @@ -18,6 +18,7 @@ properties:
> >    compatible:
> >      oneOf:
> >        - enum:
> > +          - qcom,qcs8300-dp
> >            - qcom,sa8775p-dp
> >            - qcom,sc7180-dp
> >            - qcom,sc7280-dp
> > @@ -179,6 +180,7 @@ allOf:
> >            compatible:
> >              contains:
> >                enum:
> > +                - qcom,qcs8300-dp
> >                  - qcom,sa8775p-dp
> >                  - qcom,x1e80100-dp
> >        then:
> > @@ -241,11 +243,25 @@ allOf:
> >                minItems: 5
> >                maxItems: 6
> >          else:
> > -          # Default to 2 streams MST
> > -          properties:
> > -            clocks:
> > -              minItems: 6
> > -              maxItems: 6
> > +          if:
> 
> Please do not nest if:then:if:then. It gets unreadable very fast.
> 
> I don't even understand why you need this. The code does not exist in
> the next, either. That does not help.

I picked up the MST bindings patchset, so the code should be in linux-next
soon. It already contains nested if-then-else which defines the number
of MST streams available on the platform (R-B'ed by RobH). If you think
that we should remove the nested if's I'd repost the bindings series
first.

-- 
With best wishes
Dmitry
