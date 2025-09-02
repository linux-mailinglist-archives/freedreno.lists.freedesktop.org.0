Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C726B3FBD1
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 12:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F003610E649;
	Tue,  2 Sep 2025 10:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvgMUzYx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AAE10E649
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 10:07:22 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RnRO020757
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 10:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=lioLz+MVb+lNAwEehrq912Az
 AcaUt5myxr/iYapOUHk=; b=SvgMUzYxGKdZZyKPhp1OwR6qTyNBlKhCOywOuZjT
 m2PHwjCOpXk0RstPf8TVPfcw+I8DnE5FYwJH85mR8yL3WAGkdRdBAt3KZ0J8ff0X
 tu3gOSYtQgcwXmwFu0SrG62EqNz9UlkzJ5jZecOdMJeNr/ilnazVs2rJV9HRUKNc
 LB8eLtxrT77Vj0vnUb6rT7ipr51cDfdEQE0OCdCwt8NgFkYzIHN04CImk7Q0JhZ3
 c4mmP3OOpAp3kmW39ju/kvvuC1l6KKP7R/yxAWLWmKESkC3jLmJ5uMCnJ1xh0VFu
 JWmXuHIlQ/SNQsA9nXpYpIB4dIj81gu7jnnGgI7Sjr3pEg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8ryfgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 10:07:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-718c2590e94so34815556d6.1
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 03:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756807640; x=1757412440;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lioLz+MVb+lNAwEehrq912AzAcaUt5myxr/iYapOUHk=;
 b=obn0y/zwgjefP+AE1sQ/3KNk5tBwjPRUFC28vp0BAIx3ZqLNCFKPqsLnD8ZYMEoc1H
 URGlfYdB64Ko+UYhGcJRocN/iO1iiP2uztcQ0sWKq+v441FhFEFFPr0LnUsfXm8h2U3d
 Nqt4on91opATgdzn30S0aVpKgPueoqN9+HbTiqQcv63VSfe3fYlWC8lAWBP/sj7julHQ
 CyNYPqmLvHs/K1DaxewsSfwjADhHKyZntNl3FuxRmHqEUY7OXFahpGqh5BAFOkk+NyEl
 0IP+OyV1HKIAWpVe2gH5L4mIWWycJp2qUTP52iLdyTh4oeYapF53vClb/AbxUZo9fYPA
 RB8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU4iv4IuMSwya+zSw/CDsoHquBbVBGRZLUCnsP+yknDwRQlhhjEY06/Z+XjDQfIhUIZKTVN7EYf+Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9clgbT//Hxr+7ILm/phGf/0ujx4BDhF+niRDKVflL6RL0qPXA
 q2qwuD/jN8SEN07fB3ghLl+pn7mfPpEEBX0Zfvlc/QavOUX30pUf1R/OOoDo1trye/45NpO8Bem
 jg/YScAyw6oWUGu5WPYf9/mP8OGMHgHcN3ctODv3fjAM5FlwoKBMCYxNLb74zj1KsBJGSXBQ=
X-Gm-Gg: ASbGncsHzSt9x0TvRvkVck9HUpakRI6CK1Z1jtERUYLOfzIh9ma1yogO7XbqgNIjZgP
 g6THSXEKM4F1r8tvGvKwFu587XG1kydo+SmhkKiEGRm7rXX0oSWYE6FIQocyCc5FTC48BsHdttV
 JktUEm1s6G2tIb66y2dtRxl+sPv4KhA+Mmq/iKhAkEHKDd3Ui5FDSveuDRRFxEME3W+nh9eDY7b
 zeB3R10FHY2zR25pYrFI0VAGw54l9N6F1GyLYFZa7wK6XWGJB+xoqxku1H4aXNXQqWL+zlvXC6W
 rGxSW/BPz7MqHuAMVnuDlDyDlhUpCWNgKVZ539DXtrjd/nAtH5rK1BP4B1RmcaV3QwQBz44Z28J
 uf1RNxAH/tbZTr4dzR+4aUOcIrZFd/lUhNyoDcCzaQ/9RoeLV6Igm
X-Received: by 2002:a05:6214:1d01:b0:70e:782e:b259 with SMTP id
 6a1803df08f44-70fa99552edmr115899426d6.26.1756807640295; 
 Tue, 02 Sep 2025 03:07:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgdoQnMA6U5z0bGZ7Wuiih/B4hBhoB6kk4Yipx1tsvtcSQs2cJZx7DcWOnC6cpn/6Cs6Hvdw==
X-Received: by 2002:a05:6214:1d01:b0:70e:782e:b259 with SMTP id
 6a1803df08f44-70fa99552edmr115898976d6.26.1756807639672; 
 Tue, 02 Sep 2025 03:07:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c50317sm3922901fa.2.2025.09.02.03.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 03:07:18 -0700 (PDT)
Date: Tue, 2 Sep 2025 13:07:17 +0300
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
Message-ID: <37ax7uhzopemvmz5fgtayzz3hmnxmfcbyjhwgfgkdglynuo5oj@fud24vsqodnj>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
 <20250829-dp_mst_bindings-v7-8-2b268a43917b@oss.qualcomm.com>
 <20250901-defiant-illegal-marmot-7ce0db@kuoka>
 <abkkn4f7uca6tzjasltyysxecuuirxxvbjz6l6re5v4z6jlmuh@ugz6jtw6vo4n>
 <ddd0f518-f9e1-49e8-bbaf-b810adcd35b3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddd0f518-f9e1-49e8-bbaf-b810adcd35b3@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX+4Po4rUJDvIm
 lxqjnoGJhNHkOUqyUt0s/xym4v+lMyZCwTMUJHGT1GmjhyWhRdJspv/Ef4iqFvSauo4xFK+bTYB
 AuVLr0OS8IfW9kvZag4Pb/8Nqi+iHZ0FcEYweqh51AtGdW4miyhHC87K5wfwvrpsBPAa/8w4+8e
 SdiueM1zGJL9UBzDQ/Rde2yHgltqFz5e4H/4d3m8/gohtajRFI7jjvRQi6xvhGBnD1mqq0qsfWm
 uBuQDgEZ7+BXPN/O+E4EmQnmnMwR/mirfgYR/sqPtz4GBuZZ5WO7PkqFAxsKVnTgTaXMmD/c2tx
 I2E/fXGBFORAjfDR+pe8UZ8z+ip5Y6BdwaRaIgvd//4Enjpz3u4l+/7998t8QOuSDVrbreZ68SP
 cipD9anl
X-Proofpoint-GUID: vFta3UgZraDLgRlwNYaVCr82sHZaZZWK
X-Proofpoint-ORIG-GUID: vFta3UgZraDLgRlwNYaVCr82sHZaZZWK
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b6c1d9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=1RLsJLrTPffC7TqSMS0A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
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

On Tue, Sep 02, 2025 at 08:07:22AM +0200, Krzysztof Kozlowski wrote:
> On 02/09/2025 06:04, Dmitry Baryshkov wrote:
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> >>> index 2493b9611dcb675f4c33794ecc0ee9e8823e24d4..8459b27cacc72a4827a2e289e669163ad6250059 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> >>> @@ -2249,7 +2249,7 @@ opp-560000000 {
> >>>  			};
> >>>  
> >>>  			mdss_dp: displayport-controller@ae90000 {
> >>> -				compatible = "qcom,sm6350-dp", "qcom,sm8350-dp";
> >>> +				compatible = "qcom,sm6350-dp", "qcom,sc7180-dp";
> >>
> >> No, that's breaking all the users.
> > 
> > WHy though? Both old and new lines are using fallbacks to bind the
> > driver to the device.
> 
> Kernel has sc7180 fallback, but what if other DTS user does not and that
> other user was relying on sm8350 fallback compatible? That other user
> won't have sm6350 dedicated handling as well.

Oh, a user which has SM8350 support, wants to support SM6350, but
doesn't support SC7180 DP? How hypothetical should be our users?

> 
> That breaking of users I meant.
> 
> With the kernel it should work, assuming SC7180-dp was introduced
> similar time as 8350-dp.

SC7180 DP was introduced several years ahead of SM8350, if my memory
doesn't deceive me.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
