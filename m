Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E3CC014CA
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 15:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC46510E902;
	Thu, 23 Oct 2025 13:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hmWBgYYP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B311710E8F5
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:57:14 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7B8Rf026077
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=lNE18kBABKPwFEGxjEK15XM1
 n6QIS5Dy2gILjWbl5oI=; b=hmWBgYYPMNr0aXe4kDE73cLq6UrT7cQfheOL3949
 tL/IbSt+IPPQvIwMYJRpZllCA5YrsJF3jIz2SwKesiyC7fTRP7czgo3Y0wUmfKmI
 B0w6nCA9eQIqnkqbdk17wmgQlfaTg4zosMnHNDzhstqxqpuQ4OeSxk85bvibYdoC
 9BI5LkVGlmWTIpgP41oqKERoL5ZP8edJv65j0WOtMwxT7jkfIE5F5VLtcCjmGyCy
 ypLbvbd16ESkz/huYlwTDaZzTj9pGJBBbbM1OrYpFHcqgYewp8b0u361Yh1eIhap
 ozvQ40VMKVGmyVjdu73MaUZxdCFbtFNpQvj2UQHFO2VO1A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kfhqe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:57:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-780f914b5a4so545279b3a.1
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 01:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761209833; x=1761814633;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lNE18kBABKPwFEGxjEK15XM1n6QIS5Dy2gILjWbl5oI=;
 b=p6y4/YEEqN4n1TMX3wIRxvWqhs3Q/es+Kwb4y1/E7wcx3jjmSAe9Hx/K66kOO0pbs3
 G3XNNqrykiRuoW+a9fjHRpKC0ydB8hcby2lugRmN1dJSKRWnMAdXCuRb6zTlwylCqLLv
 REn0AF0bFzOs7QUbdT7vsb8BXJqOFL/gzJLARbvA2pfTAcvPNqY3dZvdYUM8cWpcz6lJ
 K9o2VWdbO4rxbOr8H6NRmsSn29KPAqprbApRHE4ZkXlPM5AXjf4td/o47laqjxx2qQ0h
 L9Mfm3mAN3Lws2cUtvkb5D5yekWrLnmeQWZxe6LQJHOcLDOdRyAtrMm2R5RBkUCC9Pkg
 81Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8P3bg342G5mBnvTTx3zVLMhNhrpemUTWwS3C0egdIf8EigvCQLiXgRpDfTlc7SpfvklpAH7DHWdk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzs72DOWRCcmRC7w7JBoPj2FMADqAvbwfDs9KmiGFQWho3Py+j4
 eHdrFy3SJI370QSa8IQOpGV5p4MmJEP63ZTAE00BSWeV86pxB5juiAKouG+uOI4V+Y+R3s4b5sn
 ZtD2q+19on0VP2TmhaVdwsyuyfSOU9NrdwFOCTnULdMnFh2mPyhbKKcUKU3/jPxkvaVmlb9Q=
X-Gm-Gg: ASbGncvcTVcHZ5GnvHguQq+/3F42KMKY4fKelbjj22vC6YOMyvP30f+D5+G6cZcdayD
 5KMeCZEIl1E+ehNQTVqNXRZ//rkXjsHCneRvZ22BFnzZVmF87klIZAtSzIEalun+ATpMGiehrD5
 V/rNeJTyTmfOC6h8jFXaCcix69BjXxozhPYSRtnrtRYRa79HtfZH0yk2aYC1s5J2dKOMTIpsvjk
 2dgXoe5yTQPLL+ymPTRK+RWpgET1ElZPT2OI6D3of/iXU9jDd5nh8JPx6pmk4KU0GtZdn05zSCv
 g1vavBhcbGa75m5BmP54T0gRC7qSIdoj7S+18soMSPnpKhQYFRPyDMh/29wiJAyaSZsjFlAE0Gn
 kbpNGT0nellhgN2LHqTpprZF2p/0JXSPYfJePowRyiGvCMj8O7Gnlww==
X-Received: by 2002:a05:6a00:21c9:b0:781:1a9f:aee7 with SMTP id
 d2e1a72fcca58-7a220a5e607mr31700912b3a.2.1761209833364; 
 Thu, 23 Oct 2025 01:57:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTrMxusQO9d3YWrx7AOvOf5y+PUG892+AnS4bSXJmEY45o17kf1UUxWKAK1eYBqr8xrk+JcQ==
X-Received: by 2002:a05:6a00:21c9:b0:781:1a9f:aee7 with SMTP id
 d2e1a72fcca58-7a220a5e607mr31700874b3a.2.1761209832869; 
 Thu, 23 Oct 2025 01:57:12 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a274b8add8sm1795740b3a.41.2025.10.23.01.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 01:57:12 -0700 (PDT)
Date: Thu, 23 Oct 2025 16:57:02 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 07/12] drm/panel: Set sufficient voltage for panel nt37801
Message-ID: <aPnt3quCWKLh0bcp@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
 <4f9573d3-41a4-4478-8c19-39716b29f587@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f9573d3-41a4-4478-8c19-39716b29f587@oss.qualcomm.com>
X-Proofpoint-GUID: 7EFo8tO0Ac9LgRJ8XOTDkZY3fWtnmKjX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX3qpix0bj+9Y+
 KfRb4sfcdetCH7fNip29gJVkyjWuwEqaHWqEt9wjdd6sc61Rk2eEpERvGEB1Y3sOXy8iN7EhPx8
 /lBLt4Ef+u7jxOvUMqAXmglMtfd4RRZYwGtVV78l3v7rh7m97wRdt6Zl6Gh63zA3XijopApfChW
 NZa8/MoW4RBhGjRV3uo0HzCXxHj8/ZKPmdVR//UIcAU0O25M+3jeeySwDvy81QFiog+zHoCgMa0
 50BTj4vrK3aXB9X9k85i/Z80M1chJrfuSYQBy6yrU3+B+siwYiEriWjyvb9yyzfnW7Fpcn3uEt6
 aqQFIuARuWxYmSoLfhm4XKMGYduezJpiUl6Qn6HBR9lXWubJu7JMd1C3EqmUFwR96WR6+cNFTiq
 O5HS5t/8WubkXo7phfPSdxIEPvxXlg==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f9edea cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=C7owiK3y1AEyg5OQH4AA:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 7EFo8tO0Ac9LgRJ8XOTDkZY3fWtnmKjX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031
X-Mailman-Approved-At: Thu, 23 Oct 2025 13:16:01 +0000
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

On Thu, Oct 23, 2025 at 10:22:12AM +0200, Konrad Dybcio wrote:
> On 10/23/25 10:06 AM, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> > VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> 
> This patch should have been sent separately as it's not at all
> related to extending the msm display driver to support Kaanapali
> *and* it goes through a different maintainer

OK, get it, will split panel patch.

Thanks,
Yuanjie
 
> Konrad
