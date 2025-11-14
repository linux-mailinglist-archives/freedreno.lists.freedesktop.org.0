Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB55C5D916
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 15:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2318C10EA96;
	Fri, 14 Nov 2025 14:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fCxaXnq5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TTUwpdcI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443C310EA93
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:46 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8PUNc1479481
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Wm08Oj7Apo5HgrQPJ3V0ulymMOQiyCRSYJ12wElgY/A=; b=fCxaXnq54yS74FBw
 6RHBjpeXn5Qr39HTyXLbNeEq2ik9hoBiVW0ugwCFG3qM0vQ2RGwte7C50kqnKTpN
 IlNsalNlglxG4beIZDzeOzNwRi3SFLklmbqW9ueuwu58sEqGZIBpMeetfCDS097u
 yqoSmWjSFr7ilqZ/DpUO+SPzFt6b/p1tN79tLg5vujL3UQeK9CJ4khRDPUIu0mlN
 s8Prgdq3a3rsHtesDHTZQHzQe61/tiqJD1COuxhI2tSxiVND3Rx49rSm7XXhYaaU
 aufzXSRS/6Hw4FHdVNwzwRWwqqgw9dPqeVQzRG7Af63l1DG3wzOC48TM72RfPmNe
 2I0nEw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9dtdgf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4edb366a926so27029041cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 06:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763130404; x=1763735204;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wm08Oj7Apo5HgrQPJ3V0ulymMOQiyCRSYJ12wElgY/A=;
 b=TTUwpdcI9U8xJIez6ds+/VFWL3PIpnKMhyiN5UFtO+7NTZdxuGK7Sqh5qEPB0rpr+J
 n6wbeHSrqDwWhXie72oSrOzW4T+5mkBh3Fop6VRB2NPbgFtuveVACiInaDOy48jDZlfO
 IS+5M/rI0cW+eGBC0W267NEoJWMQ7zysSJU4DdS1SBCx+5tHcqn0qcr5EFhjPH5c3hH7
 jyaNMK+DkgE8zDg0JvxppjFa/jCSj0GqYFdelUqN8tzx4yH5ZzOBOJuXp0hbfWp8xstj
 fL9V6b6Z4r0dS00lYcm0tt2bLr/XL9+h0Jbf0ITqI06FfLns81cCvdTM7ai3dQ/gvBX8
 /F5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763130404; x=1763735204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Wm08Oj7Apo5HgrQPJ3V0ulymMOQiyCRSYJ12wElgY/A=;
 b=fYYFGu102Qlq3+NgBOtoligyEz/qrWT2JIdHwqtUyR8YIZIgVkZWpVGEXo8C7W3+Y/
 UWiMapdtxDgkahEqiXILp8MyB4engxBI/uDlGFiMSc3qUvXNouE1Kqdbvyd2/5erm3us
 ThK0dZVVK+o79EvWpuwWyTB7nd7TCj4Jfp5ao3j4upsC+ycLKYEwIaBuBlaOSg4x4SVb
 t3oHoOuFZSwxjYjcOoutTtEZuzOOiN0OfoBDuXrg1i8rLiksdwwH/jUH7+xtDOsfefvu
 LeQ9aYEFbBSH1e8Eat1Jh2YSwzeq267KWnzWODC/3i8+xqK/HEdoBGBL7IGJFkr04wIC
 950g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKYsOqTxJehUX8nTwqrGtpCu9WiYktVXazbQqOxXzNcNT92LdHmPudm1L/vT0GRlk2e3dSWU8fMGY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4zYbFlAAlgsbRh9HwgYMahyVZzBS2S8A7ZeEqlpp63igxVMtY
 uvTqCr+A4MsEt8A9FbRBmlrx3cmAcPVPXTlYRjYDGxCXaS/CuK5DpkT3VcFZSPnXAu6fMON40Kt
 wR177dv6wa3fnfVzNKmcRLby0MxjJ42bGBPMWE+mdbnCmSBhYdqGTubySXKaVy4R5dYYT/H8=
X-Gm-Gg: ASbGncu4GbOegmdNB1cLl+xmrqqG5XVP+TD8SJa+mggqbC0Ct8VhUi2WdWq7bBajeZq
 Z24L4uKsEl/DvfAm8iPUZIZZYWFtm0dfv9nH9fjgPIBnsUe4gzbTYpvdPsmLsLzRAkNLZNo4zDr
 BvhC+PgKFlaS4najpq+5fYlKLfLJEXrXkwrMoQtn07GJXHOIhSq23CIJ4bbzsKis5kltrJKZvBu
 diMpx6w5txW/Exbvy/ZaIXQDwC/2rb5CPb7oKiuWsXidtvaHtG2rhGjvzu8L/pjOHKn64R3D54V
 SdWAWxm7IWtb3oqytqfJcVG+R0uXHrr9I05T/KHFc2rqHvHAStzXpNTg9putlsKBIIVsHADJeE4
 EqlTg8bXBME61tBUhuJU5EtD6ZDjGsCNoJbnKnufCLyLW6jN6DAWqblKgA/nc0K+JLF9YlPnMz6
 pZhR51+Rm3UZDW
X-Received: by 2002:a05:622a:19a5:b0:4e8:bbd4:99d8 with SMTP id
 d75a77b69052e-4edf208a86dmr48911971cf.37.1763130404198; 
 Fri, 14 Nov 2025 06:26:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFm90pluc4Y4JC2rHHO8mSgQitbLfLgaksRl5AUlSTdas0MjBH91PxBwSUSfWQtEunJDliLzg==
X-Received: by 2002:a05:622a:19a5:b0:4e8:bbd4:99d8 with SMTP id
 d75a77b69052e-4edf208a86dmr48911371cf.37.1763130403646; 
 Fri, 14 Nov 2025 06:26:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:26:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
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
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com
Subject: Re: [PATCH v3] dt-bindings: display/msm: dp-controller: Add SM6150
Date: Fri, 14 Nov 2025 16:26:34 +0200
Message-ID: <176312947282.1737000.2726577602093999056.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com>
References: <20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IaiKmGqa c=1 sm=1 tr=0 ts=69173c25 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=-ywfm2TNeMNqkeX1OTcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: iYaUOg5ZDkfE5qHtmX-k1qdAEyYuY7bq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfXybwUssTMu/PF
 DHnxC1H03Cpc8H04s6c3YN6hL2wcbTJu8wKWD/NLbcd+pylbHYT6hczYHapgMSpGxBkyZ1iJWm/
 FjfDwzQQ5gtNVZTqyv4mo6diWoZ+skOQZxb9MNfoUx7vVEgLkOCPq4wQQdLrmD42PzvPfZihMtk
 2nuhstsdmeaDV5XWmDUH444jxayOifa6SgIGM0752AV2kHFCEzBxr71X84BV9clEr+4yenI2jEy
 iKcin+laElszj6FquU+I+bszK8r49tWGvglG37vxSKknd94pa8N0FEiTwSyYeja1maZ3V3WrMaE
 9lQsiJU1UNIESKMQE3qbfyh3UVqIiPthovr7efKfssH3hKT1Atn6YkobPWEhNh2AOQzwIA/QYt+
 OqLOg3fCDAc35wITtiaTj9vkFrYIrg==
X-Proofpoint-GUID: iYaUOg5ZDkfE5qHtmX-k1qdAEyYuY7bq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140116
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

On Tue, 16 Sep 2025 20:11:03 +0800, Xiangxu Yin wrote:
> Add DisplayPort controller binding for Qualcomm SM6150 SoC.
> SM6150 uses the same controller IP as SM8150.
> Declare 'qcom,sm6150-dp' as a fallback compatible to
> 'qcom,sm8150-dp' and 'qcom,sm8350-dp' for consistency with existing
> bindings and to ensure correct matching and future clarity.
> 
> 
> [...]

Applied to msm-next, thanks!

[1/1] dt-bindings: display/msm: dp-controller: Add SM6150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e56ff0888b2f

Best regards,
-- 
With best wishes
Dmitry


