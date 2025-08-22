Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F7EB32235
	for <lists+freedreno@lfdr.de>; Fri, 22 Aug 2025 20:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF8610E0B9;
	Fri, 22 Aug 2025 18:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IpuGHeU4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05B810E0B9
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 18:20:07 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHVHEp007109
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 18:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NxtKtumnK8P7jbCRmulzU2bs
 GNNl6vGrxyGS2XDmajI=; b=IpuGHeU4jrXI4gbTONzrAZjNBA3CK7V8iBxkC60B
 sj5U69qXm/weLcj1eell4vGtNtYrJ/EY1pqfDac2TlDKpUBlsZSEUFqMThAFz3dI
 PB7nAi+FUyA7uegSWpZ03reG70vEsYs+DmT+jHmDdqIm/vb70nQeG04RjGcbldUp
 KDVoeVy7/lUgc1zAd+udtwxFTvlbJLTsJG5nPGBWN36FOH7ln6o7k0coLlCqgf9q
 IgaPem2IJFvGh8FZADYK6QmqEDp1jAn66IT2uIEw0s8Zv7whlF62C9JKbk90oYCr
 ziV1i+Q3PLdv0hbvAZE2tDiMWSsWQ4/RlFd36Do2GuNbYg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw0yr4sh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 18:20:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b134a9a179so24938411cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 11:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755886806; x=1756491606;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NxtKtumnK8P7jbCRmulzU2bsGNNl6vGrxyGS2XDmajI=;
 b=G9b/aLTlQH3qlKAdYUrb8TY56nstukwqo0jvk3tnF76vFg5SssJUGIzNYZ9WW3AROU
 zJh4Bj9rDuHtW+OTVuhALzUfIgi7Z73KMJEUVlL6+1Ey56IpHPv99GpkMg0JV4dgqxmU
 BwC/wyK6ZEpN0xppYbmq5kz86PUufLMs1AsTKiY9KRQudgXt+60BuAssFWcpyJq/nt+L
 0cj9P2IncCZPfdReGCHh4NUNNvB3m/S3b0lHplIOyHbJx/Qy/tpzlfO1zhe06tOY9V4d
 6fsV23h8pVzQ/QlT4/NSRECJ4ag2wdL55la7V+R4ErReKuy0lDxm4BtNu0UPs1SCkjPQ
 PBvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGcoGFY1NhzsGgwkI1BYI0hMbMF7QE/y0cKjTgJDHcXMF2cS38UAOJcCoqJ33x3C52JUiM+Au7sQk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8xpQnsHw/W4xQSaYbGiXV3Nl07gA40P3U65kMhoyFTs77sgnK
 oWcFj0FnR98JVmIOcSjybApty2w+Q+mTUbHixh2EpQX6MQ2PT03t9kbZ/UKIVN/tiNp8OgOMwN3
 dSCtAIkSepL83ZUSDMjradsScNwMtuwqZfHh7XmABEK/G5SrmQ9LehDwbXxYoIsWEheoa4VA=
X-Gm-Gg: ASbGncuCpHbUBvwBevVy0tmkNIQW/GJzojGo+/Z+CSKeq1wRkcKDNzZmLK/sjT62K6/
 dEIduTpemaBaqKX49eKj7B7tNPANrQae5fr9DptNsy0XLl3g7EiTU6BcAJR9mqnq55+j4fFX5YN
 ZIXhUqu7G+oz1nhfJAy5LUVq9rL3NegkfpUQ+Kmex+CtmxaOdy1kuMZx5FQFMl8wqYUTbSxkUHW
 4vsh6Qq9QTx6lj5J1un8wHZaneUWl1tGaraag8dgTzRUW6WzWWdghfmM2fL53O5TBnnA8M0l7H+
 wTOHYFpHBshtHru+IWRjaQJleGbpaxxESvmjZfM3vMUYsVqFQKv0bInBh8bqj4kJ8+6YcSjbX46
 mUGiwfwbG7vmrjQbwBvO8zRLsMNnadtDSAfVrVdTvSMOBmcSmJXcu
X-Received: by 2002:a05:622a:1189:b0:4b0:8e2e:fd9b with SMTP id
 d75a77b69052e-4b2aaa6e774mr45148411cf.28.1755886806067; 
 Fri, 22 Aug 2025 11:20:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoFNCLWAF2tAYF5UUONq++OfHCr9UeqtIPtGxLe6haKB6Cwu0mLgt3aWR5hszae30Z3Zz6DQ==
X-Received: by 2002:a05:622a:1189:b0:4b0:8e2e:fd9b with SMTP id
 d75a77b69052e-4b2aaa6e774mr45147641cf.28.1755886805361; 
 Fri, 22 Aug 2025 11:20:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e2373acsm665231fa.18.2025.08.22.11.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 11:20:03 -0700 (PDT)
Date: Fri, 22 Aug 2025 21:20:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
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
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 02/14] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
Message-ID: <vbzqtpsjkxd5qhth4k2exo2dsnfmfn5km5i5z74wun7jc5j7nb@n7dqdw3t235v>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-2-a43bd25ec39c@oss.qualcomm.com>
 <20250822142230.GA3591699-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822142230.GA3591699-robh@kernel.org>
X-Proofpoint-GUID: 77Mcj8xWgIYyrKIEqYQrja5VXC4GTBsl
X-Proofpoint-ORIG-GUID: 77Mcj8xWgIYyrKIEqYQrja5VXC4GTBsl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfXzqyRPiYWxMVn
 BXcyopILf/4S6CWF7Nkq9UfiwNRVM17rv2YNidh1/k0Q58cnRKc1wwT6gFBymBSNsJLcO3mTpZY
 NU2pfSrZqhoWF487gnXBZW6iewrZOwbgFgSvGtfsTL6za1XxYXNbwnNtzs+tDVdwgmpBumnCaj0
 eNDDyjSQnr/zW74bVq69igG9N9bxj4tEV73mryZUC77UTF8kFv3MO8OhhH9vVgTs33i4ASsZ0H0
 L7jZRrzCoWE9+cka5BFHcW36Pz/LFIPsn+JUpmycULJvqvBR4VWf8fhtKIUKYFyk7JJmav/bRcf
 hymL/i+zAV1bihWQ5j2iFdeNyAWLI60qUSN31qs3smc9OKaVjn4Efte0Wh019IhnjbMGoUvn1m2
 A+sdv+hI
X-Authority-Analysis: v=2.4 cv=TpzmhCXh c=1 sm=1 tr=0 ts=68a8b4d6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=FkOoeBMDyMZldznMw-cA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508220160
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

On Fri, Aug 22, 2025 at 09:22:30AM -0500, Rob Herring wrote:
> On Wed, Aug 20, 2025 at 05:34:44PM +0800, Xiangxu Yin wrote:
> > Add device tree binding documentation for the Qualcomm QMP USB3+DP PHY
> > on QCS615 Platform. This PHY supports both USB3 and DP functionality
> > over USB-C, with PHY mode switching capability. It does not support
> > combo mode.
> > 
> > Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> > ---
> >  .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 108 +++++++++++++++++++++
> >  1 file changed, 108 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..c2b1fbab2930f0653f4ddb95f7b54d8fe994f92d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml

> > +
> > +  resets:
> > +    maxItems: 2
> > +
> > +  reset-names:
> > +    items:
> > +      - const: phy_phy
> 
> phy_phy?

Yes, see other Qualcomm USB PHYs. And unfortunately we can not use just
'phy' here. Once this lands I plan to push corresponding changes for
several other USBC PHYs (described in qcom,msm8998-qmp-usb3-phy.yaml)
and those will have both "phy" and "phy_phy" resets.

> 
> > +      - const: dp_phy
> > +

-- 
With best wishes
Dmitry
