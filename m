Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK67Jo4jnWkcNAQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 05:05:34 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 425D7181892
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 05:05:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF5410E4A6;
	Tue, 24 Feb 2026 04:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g2Qc/tDw";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DkSrVBI1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5BC10E4A5
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:31 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O3L4VK2997189
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S+bJ33mAsYZM5n0ZwjCITHvHibRXbLW59LUKfr9cSv4=; b=g2Qc/tDwAgJXL33C
 X6YMTeqPmi4apI/RMYDzJLoJg2AoNhkHKB4Eju1to0zM+b9WEdK8/LwoJK3K/HQQ
 eSyAklg5be0nwAGU4ml/DUG0ISeY5Iiih5R87lhdp66ydeeIgHbRnavAqzg8g07n
 Y/Hsc0I2g7dK3aMD37FqYaZC9Tqc25NWxH8xysTxKY9SujlZANr+j6pcpM+nUfP9
 xn/be/mI1hGzNq4krmUR6tFvIDK3cKS7VbbLq59Om3FhGOJVWAs6mDLU+kx2Mspf
 r6TqNMwqDdqtKy2v1FLAJdUnR94UieGa9N5yRuVZ3AM8qysemHcVDIquS+QM0xkH
 VkDnuA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8sr48-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c7166a4643so5041342585a.0
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 20:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771905930; x=1772510730;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S+bJ33mAsYZM5n0ZwjCITHvHibRXbLW59LUKfr9cSv4=;
 b=DkSrVBI1rQ1fphjwPVc7nBSPFDEtaiLo8F8qjSrIHDQOqC76g4TbBw9CIYE2yeaKpA
 jN9IcHS4USmsq+frcpo9UecYv/0l2/YuC6kI5CN0Ccal2dRjFfU5ofpO87jcDFexJTOc
 fIWSu/UOlbJm9lLMXlSMBV1g6hEulYS/ssMv85VfaYPZC4CKIh2ePkeu9FEVpdKzPsFf
 +AY3GBep+hXxwwuuCjP7goyXqVsGBNq5d3vjEfX8R84VGnx+RY2SCn8hwgio9XJ0f2DB
 TFJQbCUI2QuxvH2Tr4jhZGw0CHKsgAuDWnLsj3iXEkcOtG1uVOHLo5TTpyf+dw166Vxa
 RVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771905930; x=1772510730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=S+bJ33mAsYZM5n0ZwjCITHvHibRXbLW59LUKfr9cSv4=;
 b=MmEInr4DpwcYh8diSfOw/L/fF9dwPMGmyyVIWgzEXwvhv8GB4DBulv/t1HEgu4eUPt
 knlQYiu75OCz25To/Z0gnmhRME6mbj8bMJ06c4EvsAngv7vQb4ynY9Tjp4AlH39eTOBx
 3WShqhjwkb8v+leJJ64FBfuqwRCaCmiI0FuAhfqYFDpwej4Qlo/MZTVBIKWUog1jHMLP
 NtjZnhvfE8nlxt4uaTL+uz8uHfqeKw1qa0V+8TaCRUHfPN/6tKcsqIeI9wQY2px+zrus
 bY28w0ARy5Zt4SfHGK/0qbxtsdBBZaXnLW9uVeAQ85leqPF26yYwPCr3da5TuPuveRsw
 1oNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4Czuld6m3kibQklV1BYqcX3UfvTuD8ud/F10wdWl8X7ZbfOJrETDzKVl301M1gO6Se2ls5+Bx1DU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztydtpCDmvoa/m10+uCXI17rVx9w6m6C3R3WNk/shG15y0g7/y
 74BsIIqtOiHZ2vHPrkgUzMx/aMgcAxASzTdxF4OOEQEAsSTcVgxPQS+8eduA2YxvEEou9PG2Y7A
 zs+qo/+luF7ma8SU0/xkg1f5L9OKe4md+SXGyGVG8MZ3dc/tnKG5rh++pXG5wKqmG+9mrbVw=
X-Gm-Gg: AZuq6aJk9k5cPXV7uVnsttvZxebZkoDTpF4T5IMjKxD4NG8hxuy4VFEDMVVvxq0h3Vf
 v5ovH8nx/XSAjYP0t/WEX/j+/ns2aI/cCTEQnbNTl0HHfQHrlmwz5TjF2+p5LZaFeZ79MgRK5m6
 +e/xFOLbR5nkpbwx/NUZadDKnIT7muagysq7nlSmaIrPYPKh6EmTYU5nRI9sIyN0GFrovWGP0L5
 raQLnqmwDzT7gQjgb5SVwRqpV+a+dnQQPp2ZGzwJkO5FHGdJJqrQCpjVnKC5iPBTXiDD9dZNdlD
 WvbPY38rJKaJa3DVCvtQ3JNqbS8KukhB7o0J30uyFIyz2fZBhZk99D0e5BZ2x7lNsP5MiBYFNqF
 TZ7mlP+vORJi12YrQHUjDx8i942MYdcWp/ssloZvopmOqVYFfevcxl8XXfL10LgqM10n7qE/SqU
 rTv5gDUXC8YFtgxsPlQ1ywr3p/YhZRlw4D0Fs=
X-Received: by 2002:a05:620a:1a1b:b0:8c5:3495:87e2 with SMTP id
 af79cd13be357-8cb8ca6e621mr1163980785a.39.1771905930171; 
 Mon, 23 Feb 2026 20:05:30 -0800 (PST)
X-Received: by 2002:a05:620a:1a1b:b0:8c5:3495:87e2 with SMTP id
 af79cd13be357-8cb8ca6e621mr1163977185a.39.1771905929554; 
 Mon, 23 Feb 2026 20:05:29 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb4c530sm1913135e87.83.2026.02.23.20.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 20:05:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
Subject: Re: [PATCH] Revert "drm/msm/dpu: try reserving the DSPP-less LM first"
Date: Tue, 24 Feb 2026 06:05:24 +0200
Message-ID: <177190591479.429979.2907662017829617135.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260214-revert-dspp-less-v1-1-be0d636a2a6e@oss.qualcomm.com>
References: <20260214-revert-dspp-less-v1-1-be0d636a2a6e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7LcPF6O5toS2ej4GeOm9dd1WfJvEG03F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAzMSBTYWx0ZWRfX2h1iIr5iEpsY
 OrCexwDtk5ULU+1x7+ihqXPBH5niIkSi0mwJTmfLiItsTj3Ujgyz2jOlkOaC70iCpUHn+e/3MeM
 zRGbcjPJ4V3SGNNZLhsd1ZrqSH0Ct9XSFBlg9BUxWJz/LtiVfwovARKCF2MSXLcWd0AaRcgl87O
 2Jj9Ux8FWQ0LGiSzOKqbkpHSqijWX81wU/OsdpnXj0EP8nuBg2tlk0UNJ5yEQG91BT3QMs+xeWY
 E+0Kdmus5KFnHOCsHXf7ceYLdVSx6JeGoySBG8dmdM8Ksg/IS2VqnPYJkbdCLUIYrMrNg1ZhYC3
 AB68iwsi8QwYvWwTeCBlvnihS+bl37seIKCh16TNXwazCpthFff1RxuCR6c9uXxpqAAJQyFZpkv
 gi5CCeXI22NIC6O7CfILahcgOi9erd6zTGyn1aSszC69YQb5NN+/uO7gD6E91b4lChMmcZ61nNq
 7NKeHX4J6yxwA5reHbw==
X-Proofpoint-GUID: 7LcPF6O5toS2ej4GeOm9dd1WfJvEG03F
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699d238a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8
 a=46aXZEyc5aAzpVtxjjMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240031
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:val@packett.cool,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 425D7181892
X-Rspamd-Action: no action

On Sat, 14 Feb 2026 01:02:59 +0200, Dmitry Baryshkov wrote:
> This reverts commit 42f62cd79578 ("drm/msm/dpu: try reserving the
> DSPP-less LM first"). It seems on later DPUs using higher LMs require
> some additional setup or conflicts with the hardware defaults. Val (and
> other developers) reported blue screen on Hamoa (X1E80100) laptops.
> Revert the offending commit until we understand, what is the issue.
> 
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] Revert "drm/msm/dpu: try reserving the DSPP-less LM first"
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9f593419eb42

Best regards,
-- 
With best wishes
Dmitry


