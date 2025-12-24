Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB3DCDB85A
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 07:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C6D10E338;
	Wed, 24 Dec 2025 06:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ei40aiV4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ba5hebha";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6D210E338
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 06:37:02 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO17ZMk1597861
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 06:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=KeX5BfcX6vNByzVdG2gumkgs
 oVp1IkdZbk816xn3kj0=; b=Ei40aiV4UwtrEMsNMl4mHo2xpKBlXKccPSZDFMa+
 I1LzYWIq1GkHLezukjJyHX3XDUMhDT13hthskw2QHDQ25Iz+dCSKf4z6UtDkRv00
 vkW/q0cAI/c9tCIuiHWk1JRC++G3Gw5mXUFNKo1xqHmmoJ0+zaJEy6hOW+/0WhIx
 OFbXEQpqLhv/HPtPxPYmFW3Ueov0bl6ddTAPMMkcyuh5FsiQG+lFaY00zSLG56X+
 L1Pw2LUx/cfN8NuwI2HVozGDDhVcU2ZKktoQt8rlgQL6DWd5YHUnFFZjn+A3Ekkc
 vb9t06A/I7NKqPg4Mzl25qf57ga2KgFKhN8pif8ggsS3JQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683gqu4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 06:37:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4edad69b4e8so119999281cf.1
 for <freedreno@lists.freedesktop.org>; Tue, 23 Dec 2025 22:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766558221; x=1767163021;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KeX5BfcX6vNByzVdG2gumkgsoVp1IkdZbk816xn3kj0=;
 b=ba5hebhaw/+nHmlQTI91VlZeNI3Q/dVV/GA4ELiQjrqhZdl1HZBWDe0mHa6jtDkzPy
 EIbyhYGUdFzaEoJMMk71FM/tUNupMl/OH1mSHVzKC+5apJrzSKoVNSg8Hi2ZJTHW/+Wn
 3tnOBPDkU86Qgr+m64y3jGPnw0j7Efbh+EpoCUL+Wko1mLrlOUv2ISx3uCb3rw6lgRWv
 hmEIxb9cNCtXQm9Q8RiNWG0BJLnbW+sS2a0V4OK5+F/2/5btEeEcLtzAVEFLi9NeFd85
 Gm2G6UUMMH2lnFwTfRRD6zo4RRxZHlaakKmDJmxXYDWEmS6zjVntLCg1EPEw4FZ4Y8hm
 6fQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766558221; x=1767163021;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KeX5BfcX6vNByzVdG2gumkgsoVp1IkdZbk816xn3kj0=;
 b=KCj+v17ROkxDDljjKVndTwmi+B4VdURcaEx/tS0r/YlSpUYx/1akFgHzvDU/YtUGNC
 xcbGsOI0KIEARdJOMPX12mWfD7fGxnOO/x8VnbaLm0PK+PIdY7996xR8howF1wC5DThe
 WJCoJU0m1WBDuoHGw9S7268vCR5Ovgebrj3+2zmQRespwgN6JpxNKq/gMxZ2ia88j8TC
 NF9I779vhlE91GADfoUnwmgwivACWuocffV8SLgqLzd2p7ugMJSjWXv0WmSWgSB44DlT
 VwXFfKYmZttvn+ox7U90FJu4ToSr+qTzUU3RJRQfubv9biu3YfOAs9yCOJ9QTpjfPrf4
 d0qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhNHWlaRYZ8OkO89+ujeunXaU/Ilw8i1oba5gAGGl0ic8gqjX+B1IE4piSQoHRv7vPiY2+zrKZleE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMdESUSNl1kH6IqLX7XFIweIgUDTRYwfCpiaIKSl1qYbvp/0X9
 7IH4yXzpQNGLL1ytkUH0uoLPqwU31sDC+sEC4KE6ZS/FdXxWWLnltvnKJg4RqWAwG3N0K16s0ad
 b4cQccyYdrPzdCGm0R6BV8k8YpnmgY6kJ6jf8cmY4C1IxoqiiYxHv8KcXCSzETt4tHWyu5KE=
X-Gm-Gg: AY/fxX4Py4MzqlcGdddRbk7+n5/lywI6YmMfEPhSxbx2e3toxGFjRj93UJvwOOVFukJ
 O/TyLNgYNKHn9pRKGIQfz+rU/dvfmOL1lLD1HV7YEFOa/x1/Q65OonE4SjGBlOxFMXMP48thrAO
 kPFCW8+CnjABxVYEdtjsVBwlUi+wKE4K+mVJvnBQoVpq4VsdatCTvsgNVOwcFPBhDuXmC80f8ZF
 klE1+L9le8vYtgG8Abkwjr2iZNJAVcsrk+UJXsgIHXxUNZquEI+kv2UYZvx7dip9S0/LretUHVy
 0V66SOX9DyLhZbSniMGntIAx733Yw51vldSW1ZiY7nElELzEWiTW59xs0dwckde2sYDvurhkW5F
 jbZj8yfP93dM+uTcYavhrZWCoQGT15/lxPag2wQeWeLwXEDNddK6goEaulE5rX/urd9UyhaFWBk
 gflIOUOIUl85b2YZpSWNubZdc=
X-Received: by 2002:a05:622a:58c:b0:4ee:1bdb:a547 with SMTP id
 d75a77b69052e-4f35f3b7549mr296548101cf.14.1766558221394; 
 Tue, 23 Dec 2025 22:37:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfpClwcc9VlLbybjSbaNc7rAMagT1DfPo4Txy+E3PjiFL8vV/x6N/mNkuPkqXE1VP6sSd9Dw==
X-Received: by 2002:a05:622a:58c:b0:4ee:1bdb:a547 with SMTP id
 d75a77b69052e-4f35f3b7549mr296547861cf.14.1766558221023; 
 Tue, 23 Dec 2025 22:37:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18618d85sm4591957e87.48.2025.12.23.22.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 22:37:00 -0800 (PST)
Date: Wed, 24 Dec 2025 08:36:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v3 1/5] dt-bindings: display: msm-dsi-phy-7nm: document
 the QCS8300 DSI PHY
Message-ID: <bfuds7xrlgril2r2y3hysmvrboobietm5garm5q6t4gy36jvuq@qyosxqib3nv3>
References: <20251125013302.3835909-1-quic_amakhija@quicinc.com>
 <20251125013302.3835909-2-quic_amakhija@quicinc.com>
 <20251125-mauve-tamarin-of-education-c94bfb@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-mauve-tamarin-of-education-c94bfb@kuoka>
X-Proofpoint-GUID: SJyS4jVG3BxjF6SfuSk3nUa_dAr07Taj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1NSBTYWx0ZWRfXzenzjKsCZwdc
 /YKhO0VO9Vwxx1K0caSipYZCb665YRvd5DvnUiLSHW7CvtUg0DXLFvMGMdNJx5Kodv42hIxdtF9
 zRiJsa4YxSM4ySxbTWNKUOmhajzSZkeFc/IP7/hL5U2D3zQ3Oi/OoHhOIZbUSdIGoYrRidX9cgQ
 Z1sSWlCq8dDH8jMzuBqcDqsA1WD0I2of9jslkq0hYaASnYM42DutzNxUaidX9zkg9Vym6GFSVP/
 lvP2+mzWsJclDxurp9CIEZ2nNv/X4QNDBVsQm1jljT1UHT37nhrmG+p3MVXFrGqKqZIs1hHHMlu
 EGyiR6CTmUNphWWTyiEr4utqRrSbKaB10jHO6nCz/veSZcccmmwKH0h8ztiui7DhMvXZNYFCDx8
 RflGjzMFAo1lOGcNjdauJ9z6uy3Va6f0PqwlUIKKRmIByXGArFN7MDQgIf27JL4+da69/itSQlE
 CYcw6VfmGVAUW9BRdZA==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694b8a0e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=n9dR2hj5eY1oDD93YXEA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: SJyS4jVG3BxjF6SfuSk3nUa_dAr07Taj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240055
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

On Tue, Nov 25, 2025 at 10:31:42AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Nov 25, 2025 at 07:02:58AM +0530, Ayushi Makhija wrote:
> > Document the DSI PHY on the QCS8300 Platform.
> 
> Explain the hardware, so your diff would be justified. Instead of
> stating obvious or copying the subject, say something useful. Why this
> is compatible with different platforms?

Ayushi, any updates?

-- 
With best wishes
Dmitry
