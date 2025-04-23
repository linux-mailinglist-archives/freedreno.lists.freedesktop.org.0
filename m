Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11439A98C18
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 15:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C273210E6BA;
	Wed, 23 Apr 2025 13:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTgqP1+e";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1002010E6B7
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 13:58:31 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAxVNZ017062
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 13:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=C1pEN0V7ta1blhUvOSjeh8t4
 4YefebhUlQwfthVEXOM=; b=UTgqP1+etb3ty0z6u7O7hwoOAlcDHh5vsbXu8c0z
 rwfN6RHS+54OuaLDkQPttzlnSpLzH/+b/o4UPUfSno6Ii6P0XKAvyFXhBYXRqGKD
 oSVtEJdBFsvlTxZj08ZjWxSvofBfOQGBlTPcY169WdwxucX2FL/eff9cDybipwQg
 L1Qq5AgQRK2M9anMqZeVzx3hPa0NYXdoKRkVQzQDPdtB4qk/1SHO7YQeGZPh2cbH
 IL+pXOWUaZv1EU8Gwk2Q2eQFVCrwM7UQpGzZ7fgl6vaXirhM0sHUheRN9QdZkczN
 MOXHY3NwAEfwsmDAC3N0/Dbj+KHHsbbZ1YErmYLVmef7zg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3ja6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 13:58:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c95556f824so7190485a.2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 06:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745416710; x=1746021510;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C1pEN0V7ta1blhUvOSjeh8t44YefebhUlQwfthVEXOM=;
 b=YVI9RP/SVx7BG67/h2ijjdWk1scHG30rK5+tKjOrWNmVev6wnWSg74GWJHDueRoQRq
 LBiJ4Rt654QhF2Xq3P5FBUFoz/siQV7giAW+5kUUj9He3wx2R2jJ3O2gmASG8izh1DZh
 Vk/0DyQ28ZDMGmjV9oytLRfq7RYpYZ+GaRHVDCx1tyF86wcMzG14dbQfpiI3R8S37d/C
 fAM9VLqinnC21RMLR56v5PqKi2ge3p4kTqdNKL1s6oTOdaWECyq5SgXRTQJffZ3Aya/N
 yNQVoi82Ste2U+a4p8LHH6fCUjvw3S+DD+unSQsYKf9LRi0AlPQKDqCs91JUvpCtGr1S
 q8fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHRjgNXV3ifMiLMa9+DXh4A/gUWXdEmRx9GQeApismar9IBlxhhJj8F8XrHPPQlqpYVXSMrZW4vhM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVOBHUqgpJfbauKqeerUWpqiLjQVxdjRurLNVImmBAd2pC8o2X
 XIghxJwt3TGUDuDfe+zfOln42OuhPYdZTeS1U11LVCd1nDqnmCaHrIIlGEKMvg5vmqgaoCEUq+/
 SfG6D1Qo4BpE0o0OBIFv+zUZVEL5gSPiYZ9LgfbNpoWNqOAK40I70TbkyaTj0uKLabUY=
X-Gm-Gg: ASbGncvrJiZE+EuV9Z6z6qMLSfJBBUKS9Mi41UnxPMNwvSCZjIFzK3GW/lB+LslOGH6
 nyczeRUnBkLBB8qUu9kg9ShX+L50K7CPZzP5jHWHiWtWeAh+yUTzIrMgAOuedO0yGUjoxX8RpS1
 r3fIwuCUD25F1SVG0eKojeQ41Pgn4gEgdb6rFk8GsNRS0qaaem2zaw1T9TrIwmCYBn2dUnjDPg9
 99f6CXpenCaH7u5L2kg478O0bs3d79NBmrZ7h2aUjmimO+YTr8OmGmHO0Mh4yJ5jTv0wnSbtCas
 lwrGqimuyVzy+bANjM1IpkCmKAaOWRpbDIlJg2/mKCWsmSidkxNUGbq8ru9zxjP0FDlPyWnXgaM
 =
X-Received: by 2002:a05:620a:29d4:b0:7c5:642f:b22f with SMTP id
 af79cd13be357-7c927f780aemr2925735185a.18.1745416710310; 
 Wed, 23 Apr 2025 06:58:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbMHBNHoF6fiuAveTacg+V4AVRjDSJG6H3O7cmW3Wv+n7Ux0OzCJ4jiXurojEiqthLPkdZuw==
X-Received: by 2002:a05:620a:29d4:b0:7c5:642f:b22f with SMTP id
 af79cd13be357-7c927f780aemr2925730785a.18.1745416709828; 
 Wed, 23 Apr 2025 06:58:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e721ab8c6sm461722e87.232.2025.04.23.06.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 06:58:28 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:58:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: Ayushi Makhija <amakhija@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v4 10/11] drm/bridge: anx7625: fix anx7625_sink_detect()
 to return correct hpd status
Message-ID: <5mbgo73lfr5yc7nmdgzgdogdtog6cfhqya7ekjjd2guhmogtml@ngoial7rsmrh>
References: <20250417053909.1051416-1-amakhija@qti.qualcomm.com>
 <20250417053909.1051416-11-amakhija@qti.qualcomm.com>
 <g5mrn6o2arkbt356xtisszqtiokxm4oq4gkwa23y3f3aaahbfr@umcg5ikf5qjb>
 <783a80d6-63d7-4c00-ba09-0ec07492103c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <783a80d6-63d7-4c00-ba09-0ec07492103c@quicinc.com>
X-Proofpoint-ORIG-GUID: vVaZe8nd2ZSm3PRTklGJppSLvrtw0-kf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5OCBTYWx0ZWRfX/Tr0JOLDFQnL
 06NFg/+hVJbTk76FrvUrw2EcwIVf9fUv9D8m/bwnF+zM8kPgd3/kSyXHTQZChnG0Wda8Nryfu0K
 NueYatjY2eT2geHcaMmzgiWAn7EJ4ZjiMGLwugXtdJBwzi9uQ4fzm7tPCL6ZYiBTzgaou/Lax8/
 QM0LisuQgrqA3Wv/W/LAwXJ7t9d8qWo0YpzQvhA/L0BxFEUa2qp7A4NDDH7r0mIIDRPL2JNB3Ge
 RTnCWR8z17qXkbaKxlnYp4enZPqTGCgSEktPUveDLv11rV5Tx1UWgnpsBXuqwK677rb3zSEeK7M
 GiIHA4ucp/Shv70ZiKA0EaC6M1bm3+CBRcJFta7JcA4nHAu4+54o2lfv8oWW43wkr8pU5xKv8QI
 Vg91ZzR/TU9DqYJT5uQmcOvHWKuzO8NAqxjmyYe3SVgnJh1/akmhoRe1VgzaePb+a3n72GBf
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=6808f207 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=TmeSYMYVi8BcKzM9Xd0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vVaZe8nd2ZSm3PRTklGJppSLvrtw0-kf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230098
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

On Wed, Apr 23, 2025 at 03:03:02PM +0530, Ayushi Makhija wrote:
> On 4/17/2025 4:14 PM, Dmitry Baryshkov wrote:
> > On Thu, Apr 17, 2025 at 11:09:08AM +0530, Ayushi Makhija wrote:
> >> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> >>
> >> In the anx7625_sink_detect(), the device is checked to see
> >> if it is a panel bridge, and it always sends a "connected"
> >> status to the connector. When adding the DP port on port 1 of the
> >> anx7625, it incorrectly treats it as a panel bridge and sends an
> >> always "connected" status. Instead of checking the status on the
> >> panel bridge, it's better to check the hpd_status for connectors
> >> that supports hot-plugging. This way, it verifies the hpd_status
> >> variable before sending the status to the connector.
> > 
> > Does this work if the Analogix bridge is connected to an eDP panel? In
> > such a case it should report 'connected' even before powering up the
> > panel (which might mean HPD pin being low).
> > 
> 
> Hi Dmitry,
> 
> Thanks for the review.
> 
> In case of eDP, anx7625_bridge_detect()  will not get called, because this below condition
> in anx7625_link_bridge() will not get satisfy. anx7625_sink_detect() is getting called from
> anx7625_bridge_detect().

Please mention this in the commit message. With that fixed, LGTM.

-- 
With best wishes
Dmitry
