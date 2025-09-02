Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16085B3F336
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 06:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8023610E564;
	Tue,  2 Sep 2025 04:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FbK2iQxf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E8610E564
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 04:03:56 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822Rlp7012426
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 04:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/WALGo2JvVutG6gsRclwiFGQ
 ouibq4L+PAjX0XefD1M=; b=FbK2iQxfnOMuCc7rkHLQwVJRNsv29dc/n7Xa0Mjr
 rSk/PZGspJytwWUBRjGXTUU8KxeRA7ygvpBaUghYPjXzbIuul3HSjMKtE0HKZdSd
 if8NCoQty+xj7S4bJ7AMpvUTpqKV4DcMB4P7gcQWTiBWJbjtEy1oRh9iB4foD95j
 xkJt3cAV7YkRFL7Wfp6DKqBRj55FupmMi+0t1CmcB7FIwjlyMq5XfSMVMN/yQWpu
 IGBHbk6Cw+c85lEroHjNeN3sY43jmqud/gsUcpqK8EbD5CzOrTazxejqhEMnzbjP
 6h093TkdP/jr6J5ZwLWvKmCzTPQ2wu2Tm+UFJTeKkniRoQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0eek6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 04:03:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b32b721a23so22449101cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 01 Sep 2025 21:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756785835; x=1757390635;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/WALGo2JvVutG6gsRclwiFGQouibq4L+PAjX0XefD1M=;
 b=tiVnt1jANfgg510UZzZ+2TahXDLVN7d93hKeaJL4RzNjRrWJmxuFvul8CFqDxxc5Tc
 /xj9+kPl8Q5Uq8E8vQKVnzr+Vtk3kmCuAVHlxLaeUm93XvBMYz/5Z8YINspx8lg2+vSm
 KbrKjVwjrPYvh5GXAFRTEG8EEwN7bMKQJADvnV5xHjyziBdYMNf/IBbY1xeA9Wu/3cKd
 tSZV/zK9ytjvdbwenacToC6NPvSFJ+2qJt2eHvlcJ8QdyyoutfKWvtFotSXSHN/PhdzP
 3V+Wzq8WZHXm6DYbtVdcBk7kM5ShVp37B6UW11VGNzj73t5O/SF/QrtD96n/MvFkGkVu
 0iLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURvIoT1ChIrssIljTwPqMed9ADrB3CipuPqeZcm1X0dwV9KPSbMhTOpQqEaBgXBmnkIimMjeCkE0I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvZ71TmUtEM8h7M4YahlT+6Ze4piojZsgJMKCByKsdir+MaBw0
 80N5AvqMtjDfz1D2wQQdPQlTtuIIY8lTGaCDIGIy/FWaxNFzdXJ9DB1a8fP7Pm5RpyvwYXnF+3l
 JpDaiweJaOD0u+X+CfGum+1jvnWL+xkFMKQ7zhNKhDhcEBvbQH8A6COzPJzTUKn2uPcPzFUQ=
X-Gm-Gg: ASbGncsrOzKBbmPdn8bbo4U7NThXpE0fHfVopDmUunULJtos6n8DzDv4qPxr4CoA83R
 QiH5kzXb4GMoF2czKDuqJbPq4aS7uUDRtPE3E2ND11oBkzAlOPS7WGrb+BB6kxWKZWWgZxNV40c
 mWGNm5OJUv7fFlE++LTXRM3XTu/gdo3K4foiwqoNbHzH4bSkB2s0GJtxQdDtrRP2J2cvnSz2+hM
 WkT7VEHn2mGaqpGiyi09vpEl/XXdnxenjM7b+vPxHryEUfHyoys+tz23Yanr4pLywW4w2FTh26A
 75biS5TrgTIeZ+sQbC/MNikk4EA32ZBbjzGH43Qjhtz3rAG8+Qo4qgFPJaTjrDVOzlJDTe7jKRm
 JskvIUsz2OrxiUqaYJGrtIwAPcPwXvJlAHkZrs8Ce6eZXjXkyDhR1
X-Received: by 2002:ac8:5741:0:b0:4b3:196e:d10b with SMTP id
 d75a77b69052e-4b31d855248mr109144321cf.35.1756785834659; 
 Mon, 01 Sep 2025 21:03:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhz3e+S9igaqklM+Nu56w7qP0qgEoNyJRpjNeMOfilH27MmdcsBcxnapYMReC1i/HfHJ18xQ==
X-Received: by 2002:ac8:5741:0:b0:4b3:196e:d10b with SMTP id
 d75a77b69052e-4b31d855248mr109143931cf.35.1756785834103; 
 Mon, 01 Sep 2025 21:03:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-560826d11aasm352891e87.3.2025.09.01.21.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 21:03:52 -0700 (PDT)
Date: Tue, 2 Sep 2025 07:03:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/9] dt-bindings: display/msm: dp-controller: fix
 fallback for SM6350
Message-ID: <qy6c2gundpbz5ixqpt2hefzfb56wcrzcaclqwg2opof4zc7lep@dpc3nv6usurk>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
 <20250829-dp_mst_bindings-v7-2-2b268a43917b@oss.qualcomm.com>
 <20250901-arboreal-gay-wolf-bcaaec@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-arboreal-gay-wolf-bcaaec@kuoka>
X-Proofpoint-GUID: a0v-6xmUk2ro-CbZ9enFwcJogTDCIdyO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX9uao2OwlzIm/
 aNiiYfOu7ZC1E7qepQuUVObR2+Cx5q+hcAaxj6Ejw5RCa793BsEF4Fp5YNKS+9bninpiXGspYbs
 qYvAYK/T9oGywrkW7yyzgTXUX8/aswa3XOsQ5+PFO+M5cRQ8a0gUL7iYRdVyqAIQ9aPvSEsahr0
 IjXZ8xpaQo5Kr5Tcfa5ROOl4NuqZUT/AGA19E+oDB6EpkK0kZj5hNZCT+X58s99mVyXdExEbMEZ
 24de3AYetMRx3D/ivFi353wledivO5TTkr9PnP5q5r1HyXKhegUvoaDxUNEZFRusCmJWpNKdLYn
 QV7NeH2R2G/DK92De1R49DDm6zNXV496coveCKPm+flekZALiqQStjIaujNwatPXstfX0Qchj4e
 vGwL9ewF
X-Proofpoint-ORIG-GUID: a0v-6xmUk2ro-CbZ9enFwcJogTDCIdyO
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b66cac cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=AgfzEzIlf9_PdHV74f4A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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

On Mon, Sep 01, 2025 at 05:45:49AM +0200, Krzysztof Kozlowski wrote:
> On Fri, Aug 29, 2025 at 01:48:15AM +0300, Dmitry Baryshkov wrote:
> > The SM6350 doesn't have MST support, as such it is not compatible with
> > the SM8350 platform. Add new entry for SM6350 with fallback to SC7180
> > (which belongs to the same generation and also doesn't have MST
> > support).
> > 
> > Fixes: 39086151593a ("dt-bindings: display: msm: dp-controller: document SM6350 compatible")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/display/msm/dp-controller.yaml     | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > index aed3bafa67e3c24d2a876acd29660378b367603a..0f814aa6f51406fdbdd7386027f88dfbacb24392 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > @@ -31,13 +31,25 @@ properties:
> >            - qcom,sm8650-dp
> >        - items:
> >            - enum:
> > -              - qcom,sar2130p-dp
> >                - qcom,sm6350-dp
> > +          - const: qcom,sc7180-dp
> > +
> > +      # deprecated entry for compatibility with old DT
> > +      - items:
> > +          - enum:
> > +              - qcom,sm6350-dp
> > +          - const: qcom,sm8350-dp
> > +        deprecated: true
> 
> If it is only about bindings then there is little benefit in keeping
> this, just drop this case.  However you cannot drop it from DTS, so this
> is a bit pointless.

Our plan is:
- land updated DT bindings, describing MST clocks on MST-enabled
  platforms,
- land updated DTS, adding MST clocks where applicable,
- land driver changes, keeping legacy support for non-MST DTs on
  MST-enabled SoCs

> 
> Lack of MST support is not informative enough to claim it is not
> compatible with 8350. For example if it was working fine via fallback,
> then that statement is simply not correct.
> 
> And it HAD to work fine, because there is nothing binding to
> qcom,sm6350-dp.

It is working fine since currently we don't have MST support on the
driver side (nor do we describe MST clocks in DT). It's true that the
driver will have to handle non-MST DT for SM8350. However I definitely
don't want to describe both cases in the bindings. SM6350 is not going
to be compatible with the MST-enabled SM8350 schema.

Yes, it's again a lesson of 'describe hardware from the beginning', the
same issue as we observe with several other Qualcomm cores.

-- 
With best wishes
Dmitry
