Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF404B45980
	for <lists+freedreno@lfdr.de>; Fri,  5 Sep 2025 15:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B868710EBAD;
	Fri,  5 Sep 2025 13:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kFNVac5W";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C8510EBAD
 for <freedreno@lists.freedesktop.org>; Fri,  5 Sep 2025 13:48:10 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856psnH013583
 for <freedreno@lists.freedesktop.org>; Fri, 5 Sep 2025 13:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Ap62K/FP1kV8FYl5nLQxsQVk
 YwLvqHfb1niQXjNYis4=; b=kFNVac5WmL+evduZmBgoD0T6kEYqwEtpzOOB7XMG
 VJsTM6cV1fa3qYXkk0UZPHxqmCUD9juJRz+N41KBPZ+hKV9Qgbxf9ksCfik8IiAm
 t69f/7Lke8FAo421AH3JiPsf5zeqJey7T5lv/5ng4VXQ5oEeuTdQHRD4nCuddDlX
 9k1omGXx2g37FaCj9ROgEiv5YpHmVr/jPp4TOilcmiFKCof/DCGwflTIkZ0fR5Yl
 KPiueD4XuMqLDqQJ1SARVhbH6eMZoVOXZZAbWBCm+iUlzLkqvkMtLBb2BcNc9F8r
 CCtfvW32rDKE6b6vOXduBr1iGwlIDc3sgTpLTiLAbDNU7w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyf8hy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 05 Sep 2025 13:48:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b5ecf597acso16092901cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 05 Sep 2025 06:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757080089; x=1757684889;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ap62K/FP1kV8FYl5nLQxsQVkYwLvqHfb1niQXjNYis4=;
 b=I5gFj/WBuKhSaxwYDZ2CAB6jadbJHZBZ/+YKYRs9mXrEikcFO5wRUJPrhVi3Jf/1L/
 v1u8eprMxTVeYt8woU4uzwoAzCzqaTxSB/24TieR6HAQxIv+WS43c2tk7KlVmGxSaFET
 JWtCAic/gnkS3WUjeS8FUZemszlSuY0LOvl1jsa0R/peXpq4oEHtdcyex3FzpRDnAALn
 nQYaW2/zMQ+VBkfQC+uKPPY1flX0XeH8sTPgXI7IaoNv7K7P4INpWZsuZ6mksAEgaIq1
 GhBFMB9z7YFMBKacLKaHNSxZ9zKh5TWFUnd0jWh9XNsUbxDLapOMouGobwL34d63KjfV
 KPvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmaVSnHhc42Cq3va82o1jpkhjceRA23ZU8Hp4EONK/feyzOfTorS9MiZZ3FHWNhH814LOkpuAG4lU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAC7MMEZN0iD/R/JXGLu3qUiav9lg4GlnkpX85ihHmjyq20CLz
 UnyUUzcF7CtnNFtWcOYW5YGzgKA5FLyiKYCaYXQYNpSzkJQq9rHTeypxvIcvNyQnZbyqkWUXtyy
 p45vx4KXUJ4mDitZE/QlArNpasEihirXth83phZ7v0qm+4JqmdSa3JkHVjmh7Fi3alUw27dU=
X-Gm-Gg: ASbGncvS+7pI0DfVUKZ7OJGixaZx7W2NwNi8LdbE99fgH+nJ5dhMSyfHgmlr20KaV9D
 RX47YncvrGyHz50IZty7N2ICsJfOr17vt8CKL+ABuM+5AinuCMoHZFAFcuIRiC4JYrJ+k+b5h7w
 RdsKYvUW4b2CL33MQbMuMSurULMh8lzai735eHYscxe3Q6AwD8l0/13RDeoIv9um0HSYNLytM6V
 gjH7/RGR7yhvOjJNjkRz0W2bVIVKulb1cGg7BvTbMIVnCDZIkVHmWqWjuXIn2SKt4I9pbchzQkt
 Jc7mjjFHLYp851N8TQ+Lk55dUBThwQze6ZVl9YfcapoMjWJxN0kYloDE7jjdwNoVQejK7Rn+Wyt
 NuLZriGh8pOEygn6lEniONPWz0grBsTiRxb3ZvZWoV+ArwEYtwNHT
X-Received: by 2002:a05:622a:38f:b0:4b4:971c:2fe4 with SMTP id
 d75a77b69052e-4b4971c3190mr98469361cf.62.1757080088825; 
 Fri, 05 Sep 2025 06:48:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU1g8bwxyXF88f0bGvMVljHRg7TlISluEwFFoi/D70N/z1VXTCr/7Gek7kIvhhpDJ2WIEJ0Q==
X-Received: by 2002:a05:622a:38f:b0:4b4:971c:2fe4 with SMTP id
 d75a77b69052e-4b4971c3190mr98468881cf.62.1757080088273; 
 Fri, 05 Sep 2025 06:48:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608abb7c74sm1792273e87.54.2025.09.05.06.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 06:48:07 -0700 (PDT)
Date: Fri, 5 Sep 2025 16:48:05 +0300
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
Message-ID: <jdbwncstextusng5boqg4v5r7krbnjts6f3zgd65cu4rrst7ay@kkod7ihbgfrp>
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
 <20250904-qcs8300_mdss-v11-2-bc8761964d76@oss.qualcomm.com>
 <p2okyfwfl23bip65koaqezlvhyo3z47bnugojcieuspr37xc7b@s3qwgbqmts4l>
 <d8aaff46-9e3b-4b53-a690-351253753edd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8aaff46-9e3b-4b53-a690-351253753edd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68baea19 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jiGyGyMmBADT3WBvkIIA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: fr52SSMQio9fIguDwhbchng3oGTLUO86
X-Proofpoint-ORIG-GUID: fr52SSMQio9fIguDwhbchng3oGTLUO86
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXzzqMpzs1/mtN
 Rzd1TVNSLerIVdxuv459N4BrcFEWPvBMByYfue8yMdfP2J1XCH5kWf5M0L0cBNzg2oYRE56xsXU
 SAdlVHItFmvc7bXNVT+cD3qyQhfWuniwfh0mcFKc/fjUao/81RdYaOq+3GmhvrYyUhuskDhCMzt
 lfAYGoBBsMUtOf31xCv7WKy62Avfsn/v8HD5l+hOAbdwMWZ1dM27Unddzb3LOiUXj5YbXTd+mik
 Sp17yfoUcmn3gK1VTEyFJU4QHPI2D36kaLN/7HX8JphUVaR/KeRIHo43K+kydTuuG82EfYB1W/6
 apMNt73bLlV/rBYnP7l3EXfx4yz0bPUJ34fHzbLK0TgdZawPiz+e+xxTh/lrbkC3OF9CuqlhSb2
 kDDzjWPw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
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

On Fri, Sep 05, 2025 at 10:50:33AM +0800, Yongxing Mou wrote:
> 
> 
> On 9/4/2025 9:43 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 04, 2025 at 03:22:37PM +0800, Yongxing Mou wrote:
> > > Add compatible string for the DisplayPort controller found on the
> > > Qualcomm QCS8300 SoC.
> > > 
> > > The Qualcomm QCS8300 platform comes with one DisplayPort controller
> > > that supports 4 MST streams.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   .../bindings/display/msm/dp-controller.yaml        | 22 ++++++++++++++++++++++
> > >   1 file changed, 22 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > index aeb4e4f36044a0ff1e78ad47b867e232b21df509..ad08fd11588c45698f7e63ecc3218a749fc8ca67 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > @@ -18,6 +18,7 @@ properties:
> > >     compatible:
> > >       oneOf:
> > >         - enum:
> > > +          - qcom,qcs8300-dp
> > 
> > Can we use fallback to qcom,sa8775p-dp instead of declaring a completely
> > new one?
> > 
> I think we can not use fallback to sa8775p, since we don't have DP1
> controller for QCS8300. SA8775P actually have 4 DP controllers (now only 2
> really used). So in the hardware, i think it is different with SA8775P and
> we need a new one.>>             - qcom,sa8775p-dp

The DP controller is the same as the one present on SA8775P.

> > >             - qcom,sc7180-dp
> > >             - qcom,sc7280-dp

-- 
With best wishes
Dmitry
