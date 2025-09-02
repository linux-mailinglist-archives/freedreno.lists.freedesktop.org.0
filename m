Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18696B3F344
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 06:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51C910E564;
	Tue,  2 Sep 2025 04:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gP/jN5XW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6FD10E564
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 04:04:56 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822Rrh2010108
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 04:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=FUbG3HJcyuVo1E28CzJ/QWui
 hMmGUR1E5R08lzHdUPg=; b=gP/jN5XWvMLs2zd9d6V46MgZe3bIzErGTzU4YfNg
 vJHsTcL+yGJEajqipi0uVENLvNkmWpRFlhrXozMkKaJNpHqvV4/mF/OwqAE7pLoB
 af6ZXmmhVzQpNYhBEsy29uATObgagA0RRcsXbcyvE50tZu/bv/cGkAN4Zj36yxNT
 wAXVyg+UKOaO5FovU0mdIl7PrV17/3XrAAZdSvAdfZXG2EmHsc5OG2+iyOG+9Fvg
 PvR2WXTn0sJ56aDlJlygvovjSOrIlT+bmchpGyH0X+K64sGCEvcAUHcKF1rpU7z5
 XfYtRwnUbL1KW7HI13iAeoiAmubF7RcADqggYkHyr8yGxg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjeee2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 04:04:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-72108a28f05so5559166d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 01 Sep 2025 21:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756785895; x=1757390695;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FUbG3HJcyuVo1E28CzJ/QWuihMmGUR1E5R08lzHdUPg=;
 b=ie+IH8vUIK3mox/S1vamy4jr08SFXRcRz7R/ecBZMosaa2RTbJ7VFb+B3amqoSvWad
 d9Kmz4QXNn8LAHHyR71BPFoAe2yICWx9tSVpDNGzNse0YfIqIzclZJ01OxAtToLWfZrg
 +lDjCLkWIcxrl8OVBbWkVUqRrsd4y25oEE9M3a+QhIBpkLFeQS22dK6IBRGM6Kqm12Rr
 CdG8Gdi4Q/dOwkc7LzZQ+ckIt90sUN69vqxe0e3iLBBWVsUGdz/S8UK1PFV1PhopegIn
 mwuXK+OSabVbejcmJS8/dEE/DNx39GCrvk6e4Yva5YRiwahi6d5HWMdoD+tWe1Xja/kU
 itfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnSKckEnd+t7aQMFQP+cBrA72wKhZQ+ePISS9JJKtXrczyydDzcv1VaPsrhwZJYsp2no2ptwn5sEo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywda/z3NmMkVNh2rOC363mi7jOEAHBI3HU7ztnc15m9Eu/+QBb2
 +lPFsWPdW44csp7Hpoa0JyzJE5zDQ3V3E90+xO189WGox6alS01eTmVhJbI61JGKnILsgGuZlvr
 jl5319wfpjJBt5QCx19FeCbzqsjGu7tYRYohZ66dWIBCdVX7gnv6yjckeSGRrdpkJ+Dz6nRg=
X-Gm-Gg: ASbGncudiZnO8BoiaQYPs8fxqxH8jiSSXz/Js6g0jOuPS8zY0UQN8ZSq6qz4sW/Y/5p
 1SEp1wblIVxWsvk8bxxLRGQThGCFCzXFNtk6hW0Pw712bJ/m3uIuX1w59e7WdZQ96v9AqPFpC38
 2YCsFkdZOQ37hy+aOUPJ7e224WLkTzyPxKVL41hzxESmmm9FZ4mvst0rgoFQdG7TQjgENfXSvkA
 5Nut5tbzvFver3iy3OwO++vopMFYhhl07reU6Ts4U/Th44UpYItEiQkiDWBtpsnT6Rppi3Z2DhE
 BnbikcL6z9UdxqQQqRrDPzxzGExV3PFS4RVMv3JUg4cuyV909ZIFlXUWQ5N/N68nj4wof5D66Zl
 6Jr0zFXNk/Hle74m5T3/IxXgcgeuN+OIID/4fjJSjeqH4XrmwICMf
X-Received: by 2002:ad4:5c63:0:b0:716:856c:4a5 with SMTP id
 6a1803df08f44-716856c0613mr77344146d6.43.1756785894807; 
 Mon, 01 Sep 2025 21:04:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHprcraanQwhdW2zFPLdUXnmfkEq2gAsf7egUurUvHlfjuXEEHMuXLdIs7YBM69Sknlftw1mg==
X-Received: by 2002:ad4:5c63:0:b0:716:856c:4a5 with SMTP id
 6a1803df08f44-716856c0613mr77343796d6.43.1756785894311; 
 Mon, 01 Sep 2025 21:04:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f5032caasm1932141fa.35.2025.09.01.21.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 21:04:52 -0700 (PDT)
Date: Tue, 2 Sep 2025 07:04:49 +0300
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
Subject: Re: [PATCH v7 8/9] arm64: dts: qcom: sm6350: correct DP
 compatibility strings
Message-ID: <abkkn4f7uca6tzjasltyysxecuuirxxvbjz6l6re5v4z6jlmuh@ugz6jtw6vo4n>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
 <20250829-dp_mst_bindings-v7-8-2b268a43917b@oss.qualcomm.com>
 <20250901-defiant-illegal-marmot-7ce0db@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-defiant-illegal-marmot-7ce0db@kuoka>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b66ce7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=lkS1JMb0PDcYJWSia6EA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: p_Vp6X87zTpJuUHGwT9Pn7kTEiXXt7-z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX5UW91fs3dlXt
 O5tXsRVS87hm6Yr1L3ZkzX5QpAa/TNyKL+DyRs73h8KgnT32n00yOg+E4Ws9lULEZILmTuXZqPh
 Kw5/PzUeTjAJQDL9nGic2IKcgXX0dnPzlA+Cw27ItPoFp8x8svz2Ar2ohDGP/fKXey5JKY2or+G
 /FtdjzrliOmIdQbxqEpRZLUXjFK1dNTwvMkqpT/9dxvs1qb5rvthKw7f1pCot/kw96oCPdWYqKM
 CZJ/UL4BdL6F2X4UVega8LyyxxdLslHnO7bji8Lep2ihMtuQfUs5thyDVkhne+PpAVekTVwM8H8
 gXCv7UPQiKOm74Gc+scVQveqOiIue1BqO2w1jI00gKg5tIYMu5Ha+Jpa2tHiyFMDafbQC57TXVb
 0o/QsqcU
X-Proofpoint-ORIG-GUID: p_Vp6X87zTpJuUHGwT9Pn7kTEiXXt7-z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
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

On Mon, Sep 01, 2025 at 05:47:04AM +0200, Krzysztof Kozlowski wrote:
> On Fri, Aug 29, 2025 at 01:48:21AM +0300, Dmitry Baryshkov wrote:
> > SM6350 doesn't have MST support, as such in DT schema it has been
> > switched to use SC7180 as a fallback compatible. Make DT file implement
> 
> That's insufficient. You basically claim to do it only because bindings
> change. Bindings were changed only because devices differ, so that's
> your true explanation here as well.
> 
> > this change.
> > 
> > Fixes: 62f87a3cac4e ("arm64: dts: qcom: sm6350: Add DisplayPort controller")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > index 2493b9611dcb675f4c33794ecc0ee9e8823e24d4..8459b27cacc72a4827a2e289e669163ad6250059 100644
> > --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > @@ -2249,7 +2249,7 @@ opp-560000000 {
> >  			};
> >  
> >  			mdss_dp: displayport-controller@ae90000 {
> > -				compatible = "qcom,sm6350-dp", "qcom,sm8350-dp";
> > +				compatible = "qcom,sm6350-dp", "qcom,sc7180-dp";
> 
> No, that's breaking all the users.

WHy though? Both old and new lines are using fallbacks to bind the
driver to the device.

-- 
With best wishes
Dmitry
