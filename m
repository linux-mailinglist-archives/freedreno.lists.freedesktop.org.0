Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA282ACE576
	for <lists+freedreno@lfdr.de>; Wed,  4 Jun 2025 22:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CCD10E809;
	Wed,  4 Jun 2025 20:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6gwSwtx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A399710E822
 for <freedreno@lists.freedesktop.org>; Wed,  4 Jun 2025 20:04:57 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554H0Taf010388
 for <freedreno@lists.freedesktop.org>; Wed, 4 Jun 2025 20:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=GETqFDBLOjNwkCUqjvq55LYL
 ugibUI1jy212SxBhuEo=; b=G6gwSwtxq2b8UV8M6h8UBQw8Q9GJs8UGaXL0zRNY
 h0/rNxpbY/Zn3+9uxXeuuhlFg7NfzkTsZFo1ZrtoQ42Cscff6vqVMhTJmyBL7WAJ
 L+Y5oIlY0giBGH47z1CWbjqEiucXZGQehxKnqQiNwMiUrLfSf3VZ61FurFlNETPD
 l2S6oy5H6l9XKkifvltS8/4KnetC9PLzy/Og0zOwY5kZW0MXuRgjOm4MWctM449t
 11vxFanZh3YztqgGsNPcF1FfgE6xTirR0lQ5YzUxEdZsRcUq1p4mCWBgzkDuw/AO
 XK0Vlv+BCEtuf4ZHHpTIz27shkTph7V/exNHLhvxAEFTMg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8yq69p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 04 Jun 2025 20:04:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7cf6c53390eso23317485a.2
 for <freedreno@lists.freedesktop.org>; Wed, 04 Jun 2025 13:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749067496; x=1749672296;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GETqFDBLOjNwkCUqjvq55LYLugibUI1jy212SxBhuEo=;
 b=ZvkKQYtOGx2ntlcW1IgdsrX23co7AdQw7VJynCWuZrrAdcJshb3vmTvh5KPe2+QmmQ
 FvVVHxiLC8vfaj9spGZJMARYC2LS42fdgaILBqxmseE+OQ0kAeyFLr0c0MBp04eQOY/F
 PCgNkzvwEMcTVPV13k9U9yYS11i+2g1/SygfD++KoV/fcDuyJ4BhRF4p4l/xY/5+hspF
 zSYGqgNWXwJm7S5IwLhq996Tw0atflZIrQdwZ4+8ZGXgsnFTLIlhTh/QbS8gpsLkgSYp
 1X6EK5CasLkR9PYQSKj97b5kN20zuhlYQLtX19EP6TdetBbQL10LIx9GHgiXX4TUMPpp
 Q6YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxJ29f3NgJ+z/l84l7Ehm13X3fHQ1dhlEcGE1QhLX5HdqnCn4+SgLB3avhcmtiK44zwdmfCur1vSY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfGkbl5yzG4hNSvtPuXQ9r9ogUF1g9GtXHJ4ZxbeOar78raqFn
 HYerActcn12oVtPXVUpDyKH18Db8JWq7ft+zXxjDZ1j24m60BDf7XodPDitgWTlijPE5vX1BLBb
 RmQ699jn92CTSlHVqYWwOIGhGVHDoO+REja6Jn4RxkQ0+mutdxuX7WT49GBlaJgzgcsx2/J8=
X-Gm-Gg: ASbGnctWKxZUpHMmH7Ppbu748YD3wofYrfwrnDaDrDCS0x7fQdJxJ9wucjv1IIVJX7c
 4thE1JFST2jgmq29L3jCjQC7sgsHuWGoKzIx1GkbmE+NARAPBxi+7O5OepOwQxKWiGyiDcjxZw7
 60MlLWos1bTkoHZ3eae8q163Ytgo3+tgrQgq0cH9k3ukz0ncLc8nLn30qKMiW54lerTlvMJ0Ch4
 fBpfFrgmQVY6pbQaD5TooGlUzxiTCLdxcW7pJ/LhvGutD8KDkIYJOma7T/fmY6PPWYz0IgtPiMp
 kxHZoqTEy2emiOZU/AA9Rtg/Ci0aTbRBpx8UMYMpit7J5rW8fdVjDjCxaCdKXnScDTXYpAIaCJY
 =
X-Received: by 2002:a05:620a:c46:b0:7d0:9ffd:423e with SMTP id
 af79cd13be357-7d21983eeafmr621583985a.13.1749067495805; 
 Wed, 04 Jun 2025 13:04:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGjedRKZXk+O2uUWdObWriSOKjKQoYLKQ0YoQHobw0lYOQSTV8DP665A92Oru+2a6e7Y36Hw==
X-Received: by 2002:a05:620a:c46:b0:7d0:9ffd:423e with SMTP id
 af79cd13be357-7d21983eeafmr621580885a.13.1749067495467; 
 Wed, 04 Jun 2025 13:04:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a85b1a898sm22612531fa.18.2025.06.04.13.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 13:04:54 -0700 (PDT)
Date: Wed, 4 Jun 2025 23:04:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: .mailmap: update Rob Clark's email address
Message-ID: <u7oip7hbhwc5ni3nd3aa3zemzz5sgdvfjeyn4ca3gttuee2335@dmqcz2m5iyxx>
References: <20250604175600.89902-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604175600.89902-1-robdclark@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDE2MCBTYWx0ZWRfX7bCd4Sr79wAD
 oM9zsLe/SSLhBz2FJMzAmj6Texb6V34PivNYIaJ3NSsS88/0UUn2ONgOfA3N0nfaGaAHedwkxjT
 RZ6mkC3ivANVMUH13DJnjmju5s+I8NUYs0wIMn/iXmP+uahOZOCm5i7slAPgGdG4i+7RdZWu80M
 USfWgjRBGuEk+uLh0F+cxWFjL8kuzbbIBCcDvpgRfP1iRdA+dVPXFZHYTtzJnvUalU8Z6J3kfFI
 EQnybtIp+3yVyBAKEDJcUWrlzU8Hn8iu9dLIVLdzoqJ1W3I1lpdZ4HLVFOSoz5lKMxh9dLdJxjk
 dzlQbgxZ32V3TgIPYmuuUOmOSdFCYHMF0xuAY6UOVjdYm6YgoaHQnw0hZEq7uQC9t1iHSVFdMkI
 FuU7VmPI18cJz2QYhc14EBKngFGWa/7rECGyM2kTWYorRy7qxcttH5G4BxK6s5Vu0Mlc7g1i
X-Proofpoint-ORIG-GUID: Rga2abxLZczQoZAQ6So82KUDRXgwEnB0
X-Proofpoint-GUID: Rga2abxLZczQoZAQ6So82KUDRXgwEnB0
X-Authority-Analysis: v=2.4 cv=T/uMT+KQ c=1 sm=1 tr=0 ts=6840a6e8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=pGLkceISAAAA:8
 a=hXrwuCzdAAAA:8 a=vIxmpEBTAAAA:8 a=cm27Pg_UAAAA:8 a=PqW8XdIGK9T-exQPSg8A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=AbCNNcS-KtgVtUcPdxgw:22 a=h_NzWJYh3K8fKrkdZWyT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_04,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=889 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040160
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

On Wed, Jun 04, 2025 at 10:55:58AM -0700, Rob Clark wrote:
> From: Rob Clark <robin.clark@oss.qualcomm.com>
> 
> Remap historical email addresses to @oss.qualcomm.com.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  .mailmap    | 2 ++
>  MAINTAINERS | 6 +++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/.mailmap b/.mailmap
> index 6a6aa09e244b..b72a164280ea 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -633,6 +633,8 @@ Richard Genoud <richard.genoud@bootlin.com> <richard.genoud@gmail.com>
>  Richard Leitner <richard.leitner@linux.dev> <dev@g0hl1n.net>
>  Richard Leitner <richard.leitner@linux.dev> <me@g0hl1n.net>
>  Richard Leitner <richard.leitner@linux.dev> <richard.leitner@skidata.com>
> +Rob Clark <robin.clark@oss.qualcomm.com> <robdclark@chromium.org>
> +Rob Clark <robin.clark@oss.qualcomm.com> <robdclark@gmail.com>


Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Welcome!


-- 
With best wishes
Dmitry
